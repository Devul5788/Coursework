import carla
import time
import numpy as np
import math

temp_filtered_obstacles = []
min_dist_obstacles = []
passed_objects = []

class Agent():
    def __init__(self, vehicle=None):
        self.vehicle = vehicle

    # def obstacle_passed(self, obstacle, transform):
    #     yaw = transform.rotation.yaw + 90
    #     slope = np.arctan2((transform.location.y - obstacle.get_location().y), (transform.location.x - obstacle.get_location().x))
    #     if(slope < 0):
    #         slope = slope + 360
    #     diff = np.abs(yaw-slope)
    #     if(diff > 90):
    #         return 1
    #     return 0
    
    def object_detection(self, throttle, brake, steer, filtered_obstacles, transform, boundary, vel):

        left = boundary[0]
        right = boundary[1]

        min_left_idx = 0
        min_left_dists = [(100, 100, 100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)
        min_right_dists = [(100, 100, 100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)

        for i in range(len(filtered_obstacles)): #For all obstacles in filtered object, check if distance less than 15
            min_dist_l = 100
            min_dist_r = 100
            x_cord = filtered_obstacles[i].get_location().x
            y_cord = filtered_obstacles[i].get_location().y

            diff_y = y_cord - transform.location.y
            diff_x = x_cord - transform.location.x
            dist = np.sqrt(diff_x**2 + diff_y**2)

            for j in range(len(left)): #For each left boundary waypoint, find the distance to the left and right boundaries from the obstacle
                diff_y_l = y_cord - left[j].transform.location.y
                diff_x_l = x_cord - left[j].transform.location.x
                dist_l = np.sqrt(diff_x_l**2 + diff_y_l**2)

                diff_y_r = y_cord - right[j].transform.location.y
                diff_x_r = x_cord - right[j].transform.location.x
                dist_r = np.sqrt(diff_x_r**2 + diff_y_r**2)
                
                if dist_l < min_dist_l: #If distance is less than min left/right distance (100 initially), set it equal to new min_dist value, and rewrite min left/right lists to:
                    min_dist_l = dist_l
                    min_left_dists[i] = (dist_l, diff_y_l, diff_x_l, x_cord, y_cord, j, dist, i) #Distance to left boundary, x&y diffs between obstacle and boundary, x&y coords, and the closest waypoint index, and distance to object?

                if dist_r < min_dist_r:
                    min_dist_r = dist_r
                    min_right_dists[i] = (dist_r, diff_y_r, diff_x_r, x_cord, y_cord, j, dist, i)
    
        global min_dist_obstacles
        global passed_objects
        
        vehicle_size = 2
        velocity = np.sqrt(vel.x**2 + vel.y**2 + vel.z**2)

        # print("%n")
        # print(velocity)
        # print(obstacle_velocity)
        # print("%n")

        for i in range(len(passed_objects)):
            # if(passed_objects[i] == 1):
            #     continue
            obstacle_vel = filtered_obstacles[i].get_velocity()
            obstacle_velocity = np.sqrt(obstacle_vel.x**2 + obstacle_vel.y**2 + obstacle_vel.z**2)

            if (min_left_dists[i][6] <= min_dist_obstacles[i] or (velocity < obstacle_velocity)):
                min_dist_obstacles[i] = min_left_dists[i][6]
            else:
                passed_objects[i] = 1

        sorted_min_left_dists = min_left_dists
        sorted_min_right_dists = min_right_dists
        sorted_min_left_dists = sorted(sorted_min_left_dists, key = lambda x: x[0]) #Sort the min left and right dist lists to the get the closest objects relative to the barrier
        sorted_min_right_dists = sorted(sorted_min_right_dists, key = lambda x: x[0])

        sorted_dist = sorted(sorted_min_left_dists, key = lambda x: x[6])

        # or (len(sorted_dist) > 1 and sorted_dist[1][6] <= vehicle_size)

        if(sorted_dist[0][6] > 15 ):
            # print("out of range")
            return (throttle, brake, steer)

        passed_all_objects = True

        for i in range(len(filtered_obstacles)):
            # print(passed_objects[sorted_min_left_dists[0][7]])
            print(sorted_min_left_dists[0][0])
            print(sorted_min_right_dists[0][0])
            print(passed_objects)
            print("iteration", i)

            if(passed_objects[i] == 0):
                passed_all_objects = False

            min_dist = min(min_left_dists[i][6], min_right_dists[i][6])

            if (passed_objects[sorted_min_left_dists[i][7]] == 0 and passed_objects[sorted_min_right_dists[i][7]] == 0 and sorted_min_left_dists[i][0] > sorted_min_right_dists[i][0]):
                print("took left")
                avg_x = (sorted_min_left_dists[i][3] + left[sorted_min_left_dists[i][5]].transform.location.x)/2 #If object is not passed, sum x-coord of left-most obstacle and closest left waypoint's x
                avg_y = (sorted_min_left_dists[i][4] + left[sorted_min_left_dists[i][5]].transform.location.y)/2
                diff_y = avg_y - transform.location.y #Calculating the difference between the average x and y and the current location of vechicle
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x) #Calculating angle and yaw
                yaw = transform.rotation.yaw * np.pi/180
                if (np.abs(max(angle, yaw) - min(angle, yaw)) > 1.5):
                    return (0.75, 0.05, np.sign(yaw))
                return (0.4, 0, (angle - yaw)*1.2)
            
            # elif space in middle:

            elif (passed_objects[sorted_min_left_dists[i][7]] == 0 and passed_objects[sorted_min_right_dists[i][7]] == 0 and sorted_min_right_dists[i][0] > sorted_min_left_dists[i][0]):
                print("took right")
                avg_x = (sorted_min_right_dists[i][3] + right[sorted_min_right_dists[i][5]].transform.location.x)/2 #If object is not passed, sum x-coord of right-most obstacle and closest right waypoint's x
                avg_y = (sorted_min_right_dists[i][4] + right[sorted_min_right_dists[i][5]].transform.location.y)/2
                diff_y = avg_y - transform.location.y #Calculating the difference between the average x and y and the current location of vechicle
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x) #Calculating angle and yaw
                yaw = transform.rotation.yaw * np.pi/180
                # print("angle", angle * 180/np.pi)
                # print("yaw", yaw * 180/np.pi)
                print((angle - yaw)*1.2)
                if (np.abs(max(angle, yaw) - min(angle, yaw)) > 1.5):
                    return (0.75, 0.05, np.sign(yaw))
                return (0.4, 0, (angle - yaw)*1.2)

        if passed_all_objects == True:
            print("passed all")
            return (throttle, brake, steer)
        else:
            print("halt")
            return (0.4, 0.18, steer)


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

        angle_change = angle-yaw

        diff_y2 = avg2.y - transform.location.y
        diff_x2 = avg2.x - transform.location.x
        angle2 = np.arctan2(diff_y2 , diff_x2)

        diff = np.abs(angle2 - angle)


        if (diff < 0.2):
            throttle = 0.6 # 0.66
            brake = 0
        else:
            throttle = 0.58 * np.cos(diff) # 0.58
            brake = 0.08 * np.sin(diff) # 0.08

        if (np.abs(max(angle, yaw) - min(angle, yaw)) > 1.5):
            return (np.sign(yaw), 0.75, 0.05)

        return (angle - yaw, throttle*0.9, brake)

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
        control = carla.VehicleControl()

        global min_dist_obstacles
        global temp_filtered_obstacles
        global passed_objects

        same = 1

        if (len(filtered_obstacles) != len(temp_filtered_obstacles)):
            min_dist_obstacles = np.array([1000.0] * len(filtered_obstacles))
            passed_objects = np.array([0] * len(filtered_obstacles))
            temp_filtered_obstacles = filtered_obstacles
            same = 0

        # print("\n\n\n\n")
        # for i in range(len(filtered_obstacles)):
        #     if(filtered_obstacles[i].id != temp_filtered_obstacles[i].id):
        #         same = 0
        #         break
        
        if (not same):
            min_dist_obstacles = np.array([1000.0] * len(filtered_obstacles))
            passed_objects = np.array([0] * len(filtered_obstacles))
            temp_filtered_obstacles = filtered_obstacles

        # steer = 0
        # throttle = 0
        (steer, throttle, brake) = self.change_control(boundary, transform)
        if len(filtered_obstacles) != 0:
            (throttle, brake, steer) = self.object_detection(throttle, brake, steer, filtered_obstacles, transform, boundary, vel)

        control.steer, control.throttle, control.brake = steer, throttle, brake  
   
        return control
