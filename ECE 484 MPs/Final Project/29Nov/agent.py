import carla
import time
import numpy as np
import math

class Agent():
    def __init__(self, vehicle=None):
        self.vehicle = vehicle
        
    def get_angle(self, boundary, transform):
        # 1 - Return the average midpoint of the left and right lanes between the 4th and 5th meter mark
        left = boundary[0]
        right = boundary[1]

        avg = (left[5].transform.location + right[5].transform.location)/2
        avg2 = (left[19].transform.location + right[19].transform.location)/2

        # 2 - We need to calculate the angle by applying tan inverse on the difference in y / diff in x
        diff_y = avg.y - transform.location.y
        diff_x = avg.x - transform.location.x
        angle = np.arctan2(diff_y , diff_x)
        yaw = transform.rotation.yaw * np.pi/180

        diff_y2 = avg2.y - transform.location.y
        diff_x2 = avg2.x - transform.location.x
        angle2 = np.arctan2(diff_y2 , diff_x2)

        diff = np.abs(angle2 - angle)


        if (diff < 0.2):
            throttle = 0.66
            brake = 0
        else:
            throttle = 0.59 * np.cos(diff)
            brake = 0.08 * np.sin(diff)

        
        # throttle = 0.5 * np.cos(diff)
        # return (np.sign(self.vehicle.get_wheel_steer_angle(carla.VehicleWheelLocation.FR_Wheel)), 3, 0)

        if (np.abs(max(angle, yaw) - min(angle, yaw)) > 1.5):
            return (np.sign(yaw), 0.75, 0.05)

        return (angle - yaw, throttle, brake)

    def run_step(self, filtered_obstacles, waypoints, vel, transform, boundary):
        """
        Execute one step of navigation.

        Args:
        filtered_obstacles
            - Type:        List[carla.Actor(), ...]
            - Description: All actors except for EGO within sensoring distance
        waypoints 
            - Type:         List[[x,y,z], ...] 
            - Description:  List All future waypoints to reach in (x,y,z) format
        vel
            - Type:         carla.Vector3D 
            - Description:  Ego's current velocity in (x, y, z) in m/s
        transform
            - Type:         carla.Transform 
            - Description:  Ego's current transform
        boundary 
            - Type:         List[List[left_boundry], List[right_boundry]]
            - Description:  left/right boundary each consists of 20 waypoints,
                            they defines the track boundary of the next 20 meters.

        Return: carla.VehicleControl()
        """
        # Actions to take during each simulation step
        # Feel Free to use carla API; however, since we already provide info to you, using API will only add to your delay time
        # Currently the timeout is set to 10s

        # Calculate dx, dy and orientation from waypoints
        # Check if filted+obstacles is none
        #control.steer
        #control.brake
        # apply_control(self, control) Applies a control object on the next tick, containing driving parameters such as throttle, steering or gear shifting. 

        print("Reach Customized Agent")
        control = carla.VehicleControl()

        # print(boundary[0])
        steer = 0
        throttle = 0
        (steer, throttle, brake) = self.get_angle(boundary, transform)
        # control.steer, control.throttle = steer, throttle  
        control.steer = steer 
        control.throttle = throttle
        control.brake = brake

        # print("\n\n\n\n\n\n")
        # print(angie_angie)
        # print("\n\n\n\n\n\n")

        # if angie_angie > 0.3 or angie_angie < -0.3:
        #     control.brake = 0.1
        # else:
        #     control.brake = 0 
        
        # carla.Vehicle.apply_control(self, control)
   
        return control
