import carla
import time
import numpy as np
import math

min_dist_obstacle = 100
temp_filtered_obstacles = []

class Agent():
    def __init__(self, vehicle=None):
        self.vehicle = vehicle

    def obstacle_passed(self, obstacle, transform):
        yaw = transform.rotation.yaw + 90
        slope = np.arctan2((transform.location.y - obstacle.get_location().y), (transform.location.x - obstacle.get_location().x))
        if(slope < 0):
            slope = slope + 360
        diff = np.abs(yaw-slope)
        if(diff > 90):
            return 1
        return 0
    
    def object_detection(self, throttle, brake, steer, filtered_obstacles, transform, boundary):

        left = boundary[0]
        right = boundary[1]

        min_left_idx = 0
        min_left_dists = [(100, 100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)
        min_right_dists = [(100, 100, 100, 100, 100, 100, 100)] * len(filtered_obstacles)

        for i in range(len(filtered_obstacles)): #For all obstacles in filtered object, check if distance less than 15
            min_dist_l = 100
            min_dist_r = 100
            x_cord = filtered_obstacles[i].get_location().x
            y_cord = filtered_obstacles[i].get_location().y

            # if(self.obstacle_passed(filtered_obstacles[i], transform) == 1):
            #     continue

            diff_y = y_cord - transform.location.y
            diff_x = x_cord - transform.location.x
            dist = np.sqrt(diff_x**2 + diff_y**2)
            if(dist > 15):
                return (throttle, brake, steer)

            for j in range(len(left)): #For each left boundary waypoint, find the distance to the left and right boundaries from the obstacle
                diff_y_l = y_cord - left[j].transform.location.y
                diff_x_l = x_cord - left[j].transform.location.x
                dist_l = np.sqrt(diff_x_l**2 + diff_y_l**2)

                diff_y_r = y_cord - right[j].transform.location.y
                diff_x_r = x_cord - right[j].transform.location.x
                dist_r = np.sqrt(diff_x_r**2 + diff_y_r**2)
                
                if dist_l < min_dist_l: #If distance is less than min left/right distance (100 initially), set it equal to new min_dist value, and rewrite min left/right lists to:
                    min_dist_l = dist_l
                    min_left_dists[i] = (dist_l, diff_y_l, diff_x_l, x_cord, y_cord, j, dist) #Distance to left boundary, x&y diffs between obstacle and boundary, x&y coords, and the closest waypoint index, and distance to object?


                if dist_r < min_dist_r:
                    min_dist_r = dist_r
                    min_right_dists[i] = (dist_r, diff_y_r, diff_x_r, x_cord, y_cord, j, dist)
                    
                
                # if dist < min_left_dists[i][0]:
                #     min_left_dists[i] = (dist, diff_y, diff_x, j)

        # print("\n")
        global min_dist_obstacle

        sorted(min_left_dists, key = lambda x: x[0]) #Sort the min left and right dist lists to the get the closest objects relative to the barrier
        sorted(min_right_dists, key = lambda x: x[0])

        # if 'min_dist_obstacle' not in locals():
        #     min_dist_obstacle = 100

        # print(min_dist_obstacle)

        passed = 0 #Intially for each obstacle, set passed as 0

        if (min_left_dists[0][6] <= min_dist_obstacle): #If for the left most object's distance is less than equal to min_dist, rewrite min dist to obstacle
            min_dist_obstacle = min_left_dists[0][6]
        else:
            # print("reached else")
            # print("\n\n\n\n\n\n\n\n")
            passed = 1 #Else, state that the object has been passed
            # return (throttle, brake, steer)

        
        # print(min_left_dists)
        # print("\n")

        # return(1, 0, steer)
        avg_x = 0
        avg_y = 0 #Set average x and y to 0 intially, and also set vechicle size

        vehicle_size = 3
        
        if min_left_dists[0][0] >= vehicle_size: #If smallest left distance is greater than car width
            if (passed == 0):
                avg_x = (min_left_dists[0][3] + left[min_left_dists[0][5]].transform.location.x)/2 #If object is not passed, sum x-coord of left-most obstacle and closest left waypoint's x
                avg_y = (min_left_dists[0][4] + left[min_left_dists[0][5]].transform.location.y)/2
            else:
                avg_x = (left[5].transform.location.x + right[5].transform.location.x)/2 #If object is passed, navigate to the center of track (MIGHT NOT WORK IF THERE IS A CAR IN CENTER)
                avg_y = (left[5].transform.location.y + right[5].transform.location.y)/2

            # print("avg x and y:")
            # print(avg_x)
            # print(avg_y)
            # print("Our x and y:")
            # print(transform.location.x)
            # print(transform.location.y)
            diff_y = avg_y - transform.location.y #Calculating the difference between the average x and y and the current location of vechicle
            diff_x = avg_x - transform.location.x
            angle = np.arctan2(diff_y , diff_x) #Calculating angle and yaw
            yaw = transform.rotation.yaw * np.pi/180
            return (0.3, 0, angle - yaw)

        # multiple obstacles (WHY IS THIS IN ELSE IF? Shouldn't this be just a seperate condition by itself?)
        elif len(filtered_obstacles) > 1:

            # go in the middle
            if min_left_dists[1][0] - min_left_dists[0][0] >= vehicle_size: #If left dist of the second object minus the distance to the first left object greater than 
                avg_x = (min_left_dists[0][3] + min_left_dists[1][3])/2 #Averaging the x and y, and calculating the yaw and angle necessary
                avg_y = (min_left_dists[0][4] + min_left_dists[1][4])/2
                diff_y = avg_y - transform.location.y
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x)
                yaw = transform.rotation.yaw * np.pi/180
                return (0.5, 0, angle - yaw)
            
            # go to the left
            elif min_left_dists[0][0] >= vehicle_size: #Isn't this redundant from above?
                next_obstacle = 0
                for i in range(len(filtered_obstacles)): #Looping through all filtered obstacles (WHY DO WE NEED THIS? ISN'T THE NEXT INDEX THE SECOND OBJECT FROM THE LEFT IN THE SORTED LIST?)
                    if (min_left_dists[i][6] <= min_dist_obstacle):
                        next_obstacle = i
                        # break
                
                if (passed == 0):
                    avg_x = (min_left_dists[0][3] + left[min_left_dists[0][5]].transform.location.x)/2 #If object is not passed, sum x-coord of left-most obstacle and closest left waypoint's x
                    avg_y = (min_left_dists[0][4] + left[min_left_dists[0][5]].transform.location.y)/2
                elif (passed == 1 and next_obstacle != 0):
                    avg_x = (min_left_dists[next_obstacle][3] + left[min_left_dists[next_obstacle][5]].transform.location.x)/2 #Else, if object is passed and for the next obstacle (simply the next index in the min_left_dict? calculate x and y)
                    avg_y = (min_left_dists[next_obstacle][4] + left[min_left_dists[next_obstacle][5]].transform.location.y)/2
                elif (passed == 1 and next_obstacle == 0):
                    avg_x = (left[5].transform.location.x + right[5].transform.location.x)/2 #Else if object is passed and there is only 1 object? Isn't that outside this whole if-else?
                    avg_y = (left[5].transform.location.y + right[5].transform.location.y)/2

                diff_y = avg_y - transform.location.y
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x)
                yaw = transform.rotation.yaw * np.pi/180
                return (0.5, 0, angle - yaw)

            # go to the right
            elif min_right_dists[0][0] >= vehicle_size:
                next_obstacle = 0
                for i in range(len(filtered_obstacles)): #Looping through all filtered obstacles (WHY DO WE NEED THIS? ISN'T THE NEXT INDEX THE SECOND OBJECT FROM THE RIGHT IN THE SORTED LIST?)
                    if (min_right_dists[i][6] <= min_dist_obstacle):
                        next_obstacle = i
                        break

                if (passed == 0):
                    avg_x = (min_right_dists[0][3] + right[min_right_dists[0][5]].transform.location.x)/2 #If object is not passed, sum x-coord of left-most obstacle and closest left waypoint's x
                    avg_y = (min_right_dists[0][4] + right[min_right_dists[0][5]].transform.location.y)/2
                elif (passed == 1 and next_obstacle != 0):
                    avg_x = (min_right_dists[next_obstacle][3] + right[min_right_dists[next_obstacle][5]].transform.location.x)/2 #Else, if object is passed and for the next obstacle (simply the next index in the min_left_dict? calculate x and y)
                    avg_y = (min_right_dists[next_obstacle][4] + right[min_right_dists[next_obstacle][5]].transform.location.y)/2
                elif (passed == 1 and next_obstacle == 0):
                    avg_x = (left[5].transform.location.x + right[5].transform.location.x)/2 #Else if object is passed and there is only 1 object? Isn't that outside this whole if-else?
                    avg_y = (left[5].transform.location.y + right[5].transform.location.y)/2

                diff_y = avg_y - transform.location.y
                diff_x = avg_x - transform.location.x
                angle = np.arctan2(diff_y , diff_x)
                yaw = transform.rotation.yaw * np.pi/180
                return (0.5, 0, angle - yaw)

        #Checking move right again? I think we need to loop through the length of obstacles. If only 1 obstacle, then check for the three conditions for left, middle, right if not them, halt. In the same loop, we can tackle multiple obstacles, and by storing list of passed for each obstacle (E.g. [1,1,0,0]) etc, we can see all the obstacles that we have passed. By checking if that obstacle is passed in the start of the for loop and continuing, we can avoid operations on passed obstacles
        elif min_right_dists[0][0] >= vehicle_size:
            if (passed == 0):
                avg_x = (min_right_dists[0][3] + right[min_right_dists[0][5]].transform.location.x)/2
                avg_y = (min_right_dists[0][4] + right[min_right_dists[0][5]].transform.location.y)/2
            else:
                avg_x = (left[5].transform.location.x + right[5].transform.location.x)/2
                avg_y = (left[5].transform.location.y + right[5].transform.location.y)/2

            diff_y = avg_y - transform.location.y
            diff_x = avg_x - transform.location.x
            angle = np.arctan2(diff_y , diff_x)
            yaw = transform.rotation.yaw * np.pi/180
            return (0.5, 0, angle - yaw)
        
        else: #Else operation for halting
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

        angle_change = angle-yaw

        diff_y2 = avg2.y - transform.location.y
        diff_x2 = avg2.x - transform.location.x
        angle2 = np.arctan2(diff_y2 , diff_x2)

        diff = np.abs(angle2 - angle)


        if (diff < 0.2):
            throttle = 0.66 # 0.66
            brake = 0
        else:
            throttle = 0.58 * np.cos(diff) # 0.58
            brake = 0.08 * np.sin(diff) # 0.08
        
        # throttle = 0.5 * np.cos(diff)
        # return (np.sign(self.vehicle.get_wheel_steer_angle(carla.VehicleWheelLocation.FR_Wheel)), 3, 0)

        # # new for apex
        # if(angle_change > 0.2): # turning left
        #     # avg = ((1 + angle_change)*left[5].transform.location + right[5].transform.location)/(2+angle_change)
        #     avg2 = ((1 + angle_change)*left[19].transform.location + right[19].transform.location)/(2+angle_change)
        #     diff_y = avg2.y - transform.location.y
        #     diff_x = avg2.x - transform.location.x
        #     angle = np.arctan2(diff_y , diff_x)

        # elif(angle_change < -0.2): # turning left
        #     # avg = (left[5].transform.location + (1 + angle_change)*right[5].transform.location)/(2+angle_change)
        #     avg2 = (left[19].transform.location + (1 + angle_change)*right[19].transform.location)/(2+angle_change)
        #     diff_y = avg2.y - transform.location.y
        #     diff_x = avg2.x - transform.location.x
        #     angle = np.arctan2(diff_y , diff_x)

        # # end new for apex

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

        global min_dist_obstacle
        global temp_filtered_obstacles

        same = 1

        if (len(filtered_obstacles) != len(temp_filtered_obstacles)):
            min_dist_obstacle = 100
            temp_filtered_obstacles = filtered_obstacles

        # print("\n\n\n\n")
        for i in range(len(filtered_obstacles)):
            if(filtered_obstacles[i].id != temp_filtered_obstacles[i].id):
                same = 0
                break
        
        if (not same):
            min_dist_obstacle = 100
            temp_filtered_obstacles = filtered_obstacles

        # print(same)
        # print("\n\n\n\n")

        # temp_filtered_obstacles.sort()
        # filtered_obstacles.sort()
        # if (temp_filtered_obstacles == filtered_obstacles):
        #     min_dist_obstacle = 100
        #     temp_filtered_obstacles = filtered_obstacles

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
