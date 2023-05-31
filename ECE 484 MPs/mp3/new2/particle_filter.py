import numpy as np
from maze import Maze, Particle, Robot
import bisect
import rospy
from gazebo_msgs.msg import  ModelState
from gazebo_msgs.srv import GetModelState
import shutil
from std_msgs.msg import Float32MultiArray
from scipy.integrate import ode
import copy

def vehicle_dynamics(t, vars, vr, delta):
    curr_x = vars[0]
    curr_y = vars[1] 
    curr_theta = vars[2]
    
    dx = vr * np.cos(curr_theta)
    dy = vr * np.sin(curr_theta)
    dtheta = delta
    return [dx,dy,dtheta]

class particleFilter:
    def __init__(self, bob, world, num_particles, sensor_limit, x_start, y_start):
        self.num_particles = num_particles  # The number of particles for the particle filter
        self.sensor_limit = sensor_limit    # The sensor limit of the sensor
        particles = list()
        for i in range(num_particles):
            x = np.random.uniform(0, world.width)
            y = np.random.uniform(0, world.height)
            particles.append(Particle(x = x, y = y, maze = world, sensor_limit = sensor_limit))
        self.particles = particles          # Randomly assign particles at the begining
        self.bob = bob                      # The estimated robot state
        self.world = world                  # The map of the maze
        self.x_start = x_start              # The starting position of the map in the gazebo simulator
        self.y_start = y_start              # The starting position of the map in the gazebo simulator
        self.modelStatePub = rospy.Publisher("/gazebo/set_model_state", ModelState, queue_size=1)
        self.controlSub = rospy.Subscriber("/gem/control", Float32MultiArray, self.__controlHandler, queue_size = 1)
        self.control = []                   # A list of control signal from the vehicle
        return

    def __controlHandler(self,data):
        """
        Description:
            Subscriber callback for /gem/control. Store control input from gem controller to be used in particleMotionModel.
        """
        tmp = list(data.data)
        self.control.append(tmp)

    def getModelState(self):
        """
        Description:
            Requests the current state of the polaris model when called
        Returns:
            modelState: contains the current model state of the polaris vehicle in gazebo
        """

        rospy.wait_for_service('/gazebo/get_model_state')
        try:
            serviceResponse = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
            modelState = serviceResponse(model_name='polaris')
        except rospy.ServiceException as exc:
            rospy.loginfo("Service did not process request: "+str(exc))
        return modelState

    def weight_gaussian_kernel(self,x1, x2, std = 5000):
        tmp1 = np.array(x1)
        tmp2 = np.array(x2)
        return np.sum(np.exp(-((tmp2-tmp1) ** 2) / (2 * std)))

    def updateWeight(self, readings_robot):
        """
        Description:
            Update the weight of each particles according to the sensor reading from the robot 
        Input:
            readings_robot: List, contains the distance between robot and wall in [front, right, rear, left] direction.
        """

        ## TODO #####
        weightedList = []
        max_weight = 0
        for particle in self.particles:
            new_weight = self.weight_gaussian_kernel(particle.read_sensor(), readings_robot)
            max_weight = max(new_weight, max_weight)
            weightedList.append(new_weight)
        weightedList = np.array(weightedList) / max_weight
        # weightedList = np.array(weightedList) / np.linalg.norm(weightedList, ord=1)
        # print("Weighted List: ", weightedList)
        # weightedList = (weightedList - np.mean(weightedList))/np.std(weightedList)
        for i, particle in enumerate(self.particles):
            particle.weight = weightedList[i]

        ###############

    def resampleParticle(self):
        """
        Description:
            Perform resample to get a new list of particles 

        [1, 10, 2]
        cs = [1, 11, 13]
        ws = 12
        """
        ## TODO #####
        particles_new = list()

        weights = np.array([p.weight for p in self.particles])
        cumulative_weights = np.cumsum(weights) ** 3
        max_val = cumulative_weights[-1]

        # print("Resample Weights: ", weights)
        # print("Cumulative Weights: ", cumulative_weights)
        # print("Max Value: ", max_val)

        all_particles = []  # for debugging

        for i in range(self.num_particles):
            weight_sample = np.random.uniform(0, max_val)
            particle_idx = None
            for j in range(len(weights)):
                if weight_sample < cumulative_weights[j]:
                    particle_idx = j
                    break
        
            selected_particle = self.particles[particle_idx]
            # all_particles.append((weight_sample, particle_idx))  # for debugging
            particles_new.append(Particle(
                selected_particle.x, 
                selected_particle.y, 
                heading = selected_particle.heading, 
                weight = selected_particle.weight,
                maze = self.world, 
                noisy = True,
                sensor_limit=self.sensor_limit))

        # print(all_particles)

        ###############

        self.particles = particles_new

    def particleMotionModel(self):
        """
        Description:
            Estimate the next state for each particle according to the control input from actual robot 
        """
        ## TODO #####
        # print(self.control)
        # print(len(self.particles))
        # print(len(self.control))
        # print('\n')
        # particle_new = []
        new_control = copy.deepcopy(self.control)
        # print(new_control)
        for c in new_control:
            v, delta = c

            for particle in self.particles:
                particle.x += v * np.cos(particle.heading) * 0.01
                particle.y += v * np.sin(particle.heading) * 0.01
                particle.heading += delta * 0.01
                # offset = []
                # offset.append(v * np.cos(particle.heading) * 0.01)
                # offset.append(v * np.sin(particle.heading) * 0.01)
                # offset.append(delta * 0.01)
                # particle.try_move(offset, maze = self.world)
        ##############

        # print("control length before:", len(self.control))
        # print("new control length after:", len(new_control))
        self.control = self.control[len(new_control):]
        # print("control length after:", len(self.control))


    def runFilter(self):
        """
        Description:
            Run PF localization
        """
        last_timestamp = 0

        while True:
            if len(self.control) == 0:
                continue
            ## TODO #####
            # Finish this function to have the particle filter running
            # print(last_timestamp)


            readings_tmp = self.bob.read_sensor()
            self.updateWeight(readings_tmp)
            self.resampleParticle()
            self.particleMotionModel()

            # Read sensor msg
            
            # Display robot and particles on map 
            self.world.show_particles(particles = self.particles, show_frequency = 10)
            self.world.show_robot(robot = self.bob)
            [est_x,est_y] = self.world.show_estimated_location(particles = self.particles)
            self.world.clear_objects()

            ###############