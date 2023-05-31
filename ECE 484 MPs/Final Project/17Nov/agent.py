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
        # print("\n\n\n\n\n\n")
        # print(left[5].transform.location - right[5].transform.location)
        # print("\n\n\n\n\n\n")
        # print(wp_ly)
        # print("\n\n\n\n\n\n")

        # dl = left[5] - left[4]
        # dr = right[5] - right[4]
        # avg = (dl + dr)/2 
        
        # 2 - We need to calculate the angle by applying tan inverse on the difference in y / diff in x
        diff_y = avg.y - transform.location.y
        diff_x = avg.x - transform.location.x
        angle = np.arctan2(diff_y , diff_x)
        yaw = transform.rotation.yaw*np.pi/180

        print("\n\n\n\n\n\n")
        print(yaw)
        print(angle)
        print("\n\n\n\n\n\n")

        if (np.abs(angle - yaw) > 1):
            return yaw + angle

        return angle - yaw

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
        control.throttle = 0.3

        # print(boundary[0])
        control.steer = 0
        theta = self.get_angle(boundary, transform)
        angie_angie = theta
        control.steer = angie_angie

        # print("\n\n\n\n\n\n")
        # print(angie_angie)
        # print("\n\n\n\n\n\n")

        # if angie_angie > 0.3 or angie_angie < -0.3:
        #     control.brake = 0.1
        # else:
        #     control.brake = 0 
        
        # carla.Vehicle.apply_control(self, control)
        return control
