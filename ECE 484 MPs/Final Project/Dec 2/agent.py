import carla
import time
import numpy as np
import math

class Agent():
    def __init__(self, vehicle=None):
        self.vehicle = vehicle
    
    def object_detection(self, throttle, brake, steer, filtered_obstacles, transform, boundary):

        left = boundary[0]
        right = boundary[1]

        min_left_idx = 0
        min_left_dists = [(100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)
        min_right_dists = [(100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)

        # for i in range(len(filtered_obstacles)):
        #     min_left_dists[i] = (100, 100, 100, 100)


        # min_left_dists.fill((100, 100, 100, 100))

        for i in range(len(filtered_obstacles)):
            min_dist_l = 100
            min_dist_r = 100
            x_cord = filtered_obstacles[i].get_location().x
            y_cord = filtered_obstacles[i].get_location().y

            diff_y = y_cord - transform.location.y
            diff_x = x_cord - transform.location.x
            dist = np.sqrt(diff_x**2 + diff_y**2)
            if(dist > 15):
                return (throttle, brake, steer)

            for j in range(len(left)):
                diff_y_l = y_cord - left[j].transform.location.y
                diff_x_l = x_cord - left[j].transform.location.x
                dist_l = np.sqrt(diff_x_l**2 + diff_y_l**2)

                diff_y_r = y_cord - right[j].transform.location.y
                diff_x_r = x_cord - right[j].transform.location.x
                dist_r = np.sqrt(diff_x_r**2 + diff_y_r**2)
                
                if dist < min_dist_l:
                    min_dist = dist_l
                    min_left_dists[i] = (dist_l, diff_y_l, diff_x_l, x_cord, y_cord, j)

                if dist < min_dist_r:
                    min_dist = dist_r
                    min_right_dists[i] = (dist_r, diff_y_r, diff_x_r, x_cord, y_cord, j)
                    
                
                # if dist < min_left_dists[i][0]:
                #     min_left_dists[i] = (dist, diff_y, diff_x, j)

        # print("\n")
        sorted(min_left_dists, key = lambda x: x[0])
        # print(min_left_dists)
        # print("\n")

        # return(1, 0, steer)
        
        if min_left_dists[0][0] >= 3:
            avg_x = (min_left_dists[0][3] + left[min_left_dists[0][5]].transform.location.x)/2
            avg_y = (min_left_dists[0][4] + left[min_left_dists[0][5]].transform.location.y)/2
            # print("avg x and y:")
            # print(avg_x)
            # print(avg_y)
            # print("Our x and y:")
            # print(transform.location.x)
            # print(transform.location.y)
            diff_y = avg_y - transform.location.y
            diff_x = avg_x - transform.location.x
            angle = np.arctan2(diff_y , diff_x)
            yaw = transform.rotation.yaw * np.pi/180
            return (0.3, 0, angle - yaw)

        elif len(filtered_obstacles) > 1:
            if min_left_dists[1][0] - min_left_dists[0][0] >= 4:
                avg_x = (min_left_dists[0][3] + min_left_dists[1][3])/2
                avg_y = (min_left_dists[0][4] + min_left_dists[1][4])/2
                diff_y = avg_y - transform.location.y
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x)
                yaw = transform.rotation.yaw * np.pi/180
                return (0.5, 0, angle - yaw)

            elif min_right_dists[0][0] >= 3:
                avg_x = (min_right_dists[0][3] + right[min_right_dists[0][5]].transform.location.x)/2
                avg_y = (min_right_dists[0][4] + right[min_right_dists[0][5]].transform.location.y)/2
                diff_y = avg_y - transform.location.y
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x)
                yaw = transform.rotation.yaw * np.pi/180
                return (0.5, 0, angle - yaw)

        elif min_right_dists[0][0] >= 3:
            avg_x = (min_right_dists[0][3] + right[min_right_dists[0][5]].transform.location.x)/2
            avg_y = (min_right_dists[0][4] + right[min_right_dists[0][5]].transform.location.y)/2
            diff_y = avg_y - transform.location.y
            diff_x = avg_x - transform.location.x
            angle = np.arctan2(diff_y , diff_x)
            yaw = transform.rotation.yaw * np.pi/180
            return (0.5, 0, angle - yaw)
        
        else:
            return (0, 1, steer)

        # for i in range(len(filtered_obstacles)):
        #     for j in range(1, len(filtered_obstacles)):
        #         x_cord1 = obstacle.get_location().x
        #         y_cord1 = obstacle.get_location().y
        #         x_cord2 = obstacle2.get_location().x
        #         y_cord2 = obstacle2.get_location().y

        #         if (np.abs(x_cord1 - x_cord2) > 1.5):
        #             avg = (x_cord1 + x_cord2)/2
        #             diff_y = avg.y - transform.location.y
        #             diff_x = avg.x - transform.location.x
        #             angle = np.arctan2(diff_y , diff_x)
        #             yaw = transform.rotation.yaw * np.pi/180

        #         diff_y = y_cord - transform.location.y
        #         diff_x = x_cord - transform.location.x
        #         dist = np.sqrt(diff_x**2 + diff_y**2)
        #         if(dist < 20):
        #             return (0, 1, steer)
        #         else:
        #             return (throttle, brake, steer)


    def change_control(self, boundary, transform):
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
            throttle = 0.65 # 0.66
            brake = 0
        else:
            throttle = 0.59 * np.cos(diff)
            brake = 0.09 * np.sin(diff) # 0.08

        
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
        (steer, throttle, brake) = self.change_control(boundary, transform)
        if len(filtered_obstacles) != 0:
            (throttle, brake, steer) = self.object_detection(throttle, brake, steer, filtered_obstacles, transform, boundary)
        control.steer, control.throttle = steer, throttle  
        control.steer = steer 
        control.throttle = throttle
        control.brake = brake
   
        return control
