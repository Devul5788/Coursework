import time
import math
import numpy as np
import cv2
import rospy
from PIL import Image
import matplotlib as plt

from line_fit import line_fit, tune_fit, bird_fit, final_viz
from Line import Line
from sensor_msgs.msg import Image
from std_msgs.msg import Header
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import Float32
from skimage import morphology



class lanenet_detector():
	def __init__(self):
		self.bridge = CvBridge()
		# NOTE
		# Uncomment this line for lane detection of GEM car in Gazebo
		# self.sub_image = rospy.Subscriber('/gem/front_single_camera/front_single_camera/image_raw', Image, self.img_callback, queue_size=1)
		# Uncomment this line for lane detection of videos in rosbag
		self.sub_image = rospy.Subscriber('camera/image_raw', Image, self.img_callback, queue_size=1)
		self.pub_image = rospy.Publisher("lane_detection/annotate", Image, queue_size=1)
		self.pub_bird = rospy.Publisher("lane_detection/birdseye", Image, queue_size=1)
		self.left_line = Line(n=5)
		self.right_line = Line(n=5)
		self.detected = False
		self.hist = True


	def img_callback(self, data):

		try:
			# Convert a ROS image message into an OpenCV image
			cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
		except CvBridgeError as e:
			print(e)

		# raw_img = cv_image.copy()
		# mask_image, bird_image = self.detection(raw_img)

		# if mask_image is not None and bird_image is not None:
		#     # Convert an OpenCV image into a ROS image message
		#     out_img_msg = self.bridge.cv2_to_imgmsg(mask_image, 'bgr8')
		#     out_bird_msg = self.bridge.cv2_to_imgmsg(bird_image, 'bgr8')

		#     # Publish image message in ROS
		#     self.pub_image.publish(out_img_msg)
		#     self.pub_bird.publish(out_bird_msg)
		# data = self.bridge.imgmsg_to_cv2(data, "bgr8")

		test_img = self.color_thresh(cv_image)
		test_img = self.bridge.cv2_to_imgmsg(test_img, '8UC1')
		self.pub_image.publish(test_img)


	def gradient_thresh(self, img, thresh_min=25, thresh_max=100):
		"""
		Apply sobel edge detection on input image in x, y direction
		"""
		#1. Convert the image to gray scale
		#2. Gaussian blur the image
		#3. Use cv2.Sobel() to find derievatives for both X and Y Axis
		#4. Use cv2.addWeighted() to combine the results
		#5. Convert each pixel to unint8, then apply threshold to get binary image

		## TODO

		####

		gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

		blurred = cv2.GaussianBlur(gray, (3, 3), 0)
	
		ddepth = cv2.CV_8U
		scale = 1
		delta = 0
		grad_x = cv2.Sobel(blurred, ddepth, 1, 0, ksize=3, scale=scale, delta=delta, borderType=cv2.BORDER_DEFAULT)
		grad_y = cv2.Sobel(blurred, ddepth, 0, 1, ksize=3, scale=scale, delta=delta, borderType=cv2.BORDER_DEFAULT)

		#print("Grad_x: ", grad_x)
		#print("Grad_y: ", grad_y)

		# abs_grad_x = cv.convertScaleAbs(grad_x)
		# abs_grad_y = cv.convertScaleAbs(grad_y)

		grad = cv2.addWeighted(grad_x, 0.5, grad_y, 0.5, 0)

		binary_output = np.zeros(grad.shape)
		for i in range(grad.shape[0]):
			for j in range(grad.shape[1]):
				binary_output[i][j] = thresh_min < grad[i][j] < thresh_max

		# print(binary_output)
		# print(binary_output.sum())
		return binary_output


	def color_thresh(self, img, thresh=(100, 255)):
		"""
		Convert RGB to HSL and threshold to binary image using S channel
		"""
		#1. Convert the image from RGB to HSL (same as hsl)
		hls_img = cv2.cvtColor(np.ascontiguousarray(img), cv2.COLOR_RGB2HLS)
		#2. Apply threshold on S channel to get binary image
		s_channel = hls_img[:,:,2]
		binary_output_s = np.zeros_like(s_channel)
		binary_output_s[(s_channel >= thresh[0]) & (s_channel <= thresh[1])] = 255
		#Hint: threshold on H to remove green grass (green has hue between 81 and 140)
		h_channel = hls_img[:,:,0]
		binary_output_h = np.zeros_like(h_channel)
		binary_output_h[(h_channel < 81) | (h_channel > 140)] = 255

		binary_output = binary_output_s & binary_output_h
		print(binary_output)
		return binary_output


	def combinedBinaryImage(self, img):
		"""
		Get combined binary image from color filter and sobel filter
		"""
		#1. Apply sobel filter and color filter on input image
		#2. Combine the outputs
		## Here you can use as many methods as you want.

		## TODO
		SobelOutput = self.gradient_thresh(img, 25, 100)
		ColorOutput = self.color_thresh(img, (100, 255))

		####

		binaryImage = np.zeros_like(SobelOutput)
		binaryImage[(ColorOutput==1)|(SobelOutput==1)] = 1
		# Remove noise from binary image
		binaryImage = morphology.remove_small_objects(binaryImage.astype('bool'),min_size=50,connectivity=2)

		return binaryImage


	def perspective_transform(self, img, verbose=False):
		"""
		Get bird's eye view from input image
		"""
		#1. Visually determine 4 source points and 4 destination points
		#2. Get M, the transform matrix, and Minv, the inverse using cv2.getPerspectiveTransform()
		#3. Generate warped image in bird view using cv2.warpPerspective()

		## TODO

		####
		IMAGE_H = img.shape[1]
		IMAGE_W = img.shape[0]

		sample_w = np.random.uniform(0, IMAGE_W)
		sample_h = np.random.uniform(0, IMAGE_H)

		src = [[420, 610], [520, 520]]
		dst = [[300, 620], [350, 310]]

		src = np.float32([[0, IMAGE_H], [1207, IMAGE_H], [0, 0], [IMAGE_W, 0]])
		dst = np.float32([[569, IMAGE_H], [711, IMAGE_H], [0, 0], [IMAGE_W, 0]])
		M = cv2.getPerspectiveTransform(src, dst)
		Minv = cv2.getPerspectiveTransform(dst, src)

		warped_img = cv2.warpPerspective(img, M, (IMAGE_W, IMAGE_H))

		return warped_img, M, Minv
	
	def lane_fit(self, img):
		horizontal_cuts = 15
		img_cuts_l = []
		img_cuts_r = []


		w, h = img.size
		
		# Cropped image of above dimension
		for i in range (horizontal_cuts):
			img_cuts_l[i] = img.crop((0, i * h/horizontal_cuts, w/2, (i+1) * h/horizontal_cuts))
			img_cuts_r[i] = img.crop((w/2, i * h/horizontal_cuts, w, (i+1) * h/horizontal_cuts))
		
		left_centroids_x = []	
		left_centroids_y = []	

		for num in range(size(img_cuts_l)):
			freq_x_l = np.zeros(w/2)
			max_x_l_freq = 0
			max_x_l = 0
			for i in range(w):
				for j in range(h):
					if (img_cuts_l[num][j][i] == 255): 
						freq_x_l[i] += 1

						if (freq_x_l[i] > max_x_l_freq):
							max_x_l_freq = freq_x_l[i]
							max_x_l = i
			
			left_centroids_x[num] = max_x_l
			left_centroids_y[num] = num*h/horizontal_cuts

		

		right_centroids_x = []	
		right_centroids_y = []	

		for num in range(size(img_cuts_l)):
			freq_x_r = np.zeros(w/2)
			max_x_r_freq = 0
			max_x_r = 0
			for i in range(w):
				for j in range(h):
					if (img_cuts_l[num][j][i] == 255): 
						freq_x_r[i] += 1

						if (freq_x_r[i] > max_x_r_freq):
							max_x_r_freq = freq_x_r[i]
							max_x_r = i
			
			right_centroids_x[num] = max_x_r
			right_centroids_y[num] = num*h/horizontal_cuts

		left_line = np.polyfit(left_centroids_x, left_centroids_y, 2)
		right_line = np.polyfit(right_centroids_x, right_centroids_y, 2)
			
		ret = {}
		ret['left_fit'] = left_line
		ret['right_fit'] = right_line
		return ret

	def detection(self, img):

		binary_img = self.combinedBinaryImage(img)
		img_birdeye, M, Minv = self.perspective_transform(binary_img)

		if not self.hist:
			# Fit lane without previous result
			ret = line_fit(img_birdeye)
			ret2 = lane_fit(img_birdeye)
			left_fit = ret2['left_fit']
			right_fit = ret2['right_fit']
			nonzerox = ret['nonzerox']
			nonzeroy = ret['nonzeroy']
			left_lane_inds = ret['left_lane_inds']
			right_lane_inds = ret['right_lane_inds']

		else:
			# Fit lane with previous result
			if not self.detected:
				ret = line_fit(img_birdeye)

				if ret is not None:
					left_fit = ret['left_fit']
					right_fit = ret['right_fit']
					nonzerox = ret['nonzerox']
					nonzeroy = ret['nonzeroy']
					left_lane_inds = ret['left_lane_inds']
					right_lane_inds = ret['right_lane_inds']

					left_fit = self.left_line.add_fit(left_fit)
					right_fit = self.right_line.add_fit(right_fit)

					self.detected = True

			else:
				left_fit = self.left_line.get_fit()
				right_fit = self.right_line.get_fit()
				ret = tune_fit(img_birdeye, left_fit, right_fit)

				if ret is not None:
					left_fit = ret['left_fit']
					right_fit = ret['right_fit']
					nonzerox = ret['nonzerox']
					nonzeroy = ret['nonzeroy']
					left_lane_inds = ret['left_lane_inds']
					right_lane_inds = ret['right_lane_inds']

					left_fit = self.left_line.add_fit(left_fit)
					right_fit = self.right_line.add_fit(right_fit)

				else:
					self.detected = False

			# Annotate original image
			bird_fit_img = None
			combine_fit_img = None
			if ret is not None:
				bird_fit_img = bird_fit(img_birdeye, ret, save_file=None)
				combine_fit_img = final_viz(img, left_fit, right_fit, Minv)
			else:
				print("Unable to detect lanes")

			return combine_fit_img, bird_fit_img


if __name__ == '__main__':
	# init args
	rospy.init_node('lanenet_node', anonymous=True)
	lanenet_detector()
	while not rospy.core.is_shutdown():
		rospy.rostime.wallsleep(0.5)