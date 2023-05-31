import rospy
from gazebo_msgs.srv import GetModelState, GetModelStateResponse
from gazebo_msgs.msg import ModelState
from ackermann_msgs.msg import AckermannDrive
import numpy as np
from std_msgs.msg import Float32MultiArray
from util import euler_to_quaternion, quaternion_to_euler

class vehicleController():

    def __init__(self):
        # Publisher to publish the control input to the vehicle model
        self.controlPub = rospy.Publisher("/ackermann_cmd", AckermannDrive, queue_size = 1)

    def getModelState(self):
        # Get the current state of the vehicle
        # Input: None
        # Output: ModelState, the state of the vehicle, contain the
        #   position, orientation, linear velocity, angular velocity
        #   of the vehicle
        rospy.wait_for_service('/gazebo/get_model_state')
        try:
            serviceResponse = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
            resp = serviceResponse(model_name='gem')
        except rospy.ServiceException as exc:
            rospy.loginfo("Service did not process request: "+str(exc))
            resp = GetModelStateResponse()
            resp.success = False
        return resp

    def execute(self, currentPose, referencePose):
        # Compute the control input to the vehicle according to the 
        # current and reference pose of the vehicle
        # Input:
        #   currentPose: ModelState, the current state of the vehicle
        #   referencePose: list, the reference state of the vehicle, 
        #       the element in the list are [ref_x, ref_y, ref_theta, ref_v]
        # Output: None

        # TODO: Implement this function
        curr_x = currentPose.pose.position.x
        curr_y = currentPose.pose.position.y
        curr_quaternion = currentPose.pose.orientation
        curr_euler = quaternion_to_euler(curr_quaternion.x, curr_quaternion.y, curr_quaternion.z, curr_quaternion.w)[2]
        curr_speed = np.sqrt(currentPose.twist.linear.x ** 2 + currentPose.twist.linear.y ** 2)

        # print("current_pose: ", currentPose)
        # print("reference_pose: ", referencePose)
        ref_x = referencePose[0]
        ref_y = referencePose[1]
        ref_euler = referencePose[2]
        ref_speed = referencePose[3]

        delta_x = np.cos(ref_euler) * (ref_x - curr_x) + np.sin(ref_euler) * (ref_y - curr_y)
        delta_y = -np.sin(ref_euler) * (ref_x - curr_x) + np.cos(ref_euler) * (ref_y - curr_y)
        delta_theta = ref_euler - curr_euler
        delta_v = ref_speed - curr_speed
        delta = np.array([delta_x, delta_y, delta_theta, delta_v]).T

        # print([delta_x, delta_y, delta_theta, delta_v])

        k_x = 0.1
        k_y = 0.05
        k_v = 0.5
        k_theta = 2

        k = np.array([[k_x, 0, 0, k_v], [0, k_y, k_theta, 0]])
        u = k @ delta
        print(u)


        #Pack computed velocity and steering angle into Ackermann command
        newAckermannCmd = AckermannDrive()
        newAckermannCmd.speed = u[0]
        newAckermannCmd.steering_angle = u[1]

        # Publish the computed control input to vehicle model
        self.controlPub.publish(newAckermannCmd)


    def setModelState(self, currState, targetState, vehicle_state = "run"):
        control = self.rearWheelFeedback(currState, targetState)
        self.controlPub.publish(control)

    def stop(self):
        newAckermannCmd = AckermannDrive()
        newAckermannCmd.speed = 0
        self.controlPub.publish(newAckermannCmd)