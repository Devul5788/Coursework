import subprocess

# 'activate virtual environment'
# activate_this_file  = "tf/env/bin/activate_this.py"
# exec(compile(open(activate_this_file, "rb").read(), activate_this_file, 'exec'), dict(__file__=activate_this_file))

'import libraries'
import numpy as np 
import pandas as pd
from tensorflow import keras
from PIL import Image
from itertools import groupby
import RPi.GPIO as GPIO
import time

'Pin Definitions'
outputPin1 = 2
outputPin2 = 3
outputPin3 = 4
outputPin4 = 17
outputPin5 = 27
outputPin6 = 22
outputPin7 = 10
outputPin8 = 9
outputPin9 = 11
outputPin10 = 5
outputPin11 = 6
outputPin12 = 13
outputPin13 = 19
outputPin14 = 26
outputPin15 = 18
outputPin16 = 23
outputPin17 = 24
outputPin18 = 25
outputPin19 = 8
samplingInputPin = 21
restartInputPin = 12
charDoneInputPin = 16
solveInputPin = 20
raspReadyOutputPin = 7

'setting modes'
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

'setting pins as input/output'
GPIO.setup(outputPin1, GPIO.OUT)
GPIO.setup(outputPin2, GPIO.OUT)
GPIO.setup(outputPin3, GPIO.OUT)
GPIO.setup(outputPin4, GPIO.OUT)
GPIO.setup(outputPin5, GPIO.OUT)
GPIO.setup(outputPin6, GPIO.OUT)
GPIO.setup(outputPin7, GPIO.OUT)
GPIO.setup(outputPin8, GPIO.OUT)
GPIO.setup(outputPin9, GPIO.OUT)
GPIO.setup(outputPin10, GPIO.OUT)
GPIO.setup(outputPin11, GPIO.OUT)
GPIO.setup(outputPin12, GPIO.OUT)
GPIO.setup(outputPin13, GPIO.OUT)
GPIO.setup(outputPin14, GPIO.OUT)
GPIO.setup(outputPin15, GPIO.OUT)
GPIO.setup(outputPin16, GPIO.OUT)
GPIO.setup(outputPin17, GPIO.OUT)
GPIO.setup(outputPin18, GPIO.OUT)
GPIO.setup(outputPin19, GPIO.OUT)
GPIO.setup(raspReadyOutputPin, GPIO.OUT)
GPIO.setup(samplingInputPin, GPIO.IN)
GPIO.setup(restartInputPin, GPIO.IN)
GPIO.setup(charDoneInputPin, GPIO.IN)
GPIO.setup(solveInputPin, GPIO.IN)

'-----------------------------------------------------------------------------------------------------------------------------------------'
def record_data():
    length = 307200
    arr = [0] * length

    for i in range (length):
        output_to_fpga(i)
        arr[i] = GPIO.input(samplingInputPin)
    
    return arr

def output_to_fpga(num):
    bin_string = bin(num)[2:].zfill(19)
    bin_string = bin_string[::-1]
    GPIO.output(outputPin19, int(bin_string[18]))
    GPIO.output(outputPin18, int(bin_string[17]))
    GPIO.output(outputPin17, int(bin_string[16]))
    GPIO.output(outputPin16, int(bin_string[15]))
    GPIO.output(outputPin15, int(bin_string[14]))
    GPIO.output(outputPin14, int(bin_string[13]))
    GPIO.output(outputPin13, int(bin_string[12]))
    GPIO.output(outputPin12, int(bin_string[11]))
    GPIO.output(outputPin11, int(bin_string[10]))
    GPIO.output(outputPin10, int(bin_string[9]))
    GPIO.output(outputPin9, int(bin_string[8]))
    GPIO.output(outputPin8, int(bin_string[7]))
    GPIO.output(outputPin7, int(bin_string[6]))
    GPIO.output(outputPin6, int(bin_string[5]))
    GPIO.output(outputPin5, int(bin_string[4]))
    GPIO.output(outputPin4, int(bin_string[3]))
    GPIO.output(outputPin3, int(bin_string[2]))
    GPIO.output(outputPin2, int(bin_string[1]))
    GPIO.output(outputPin1, int(bin_string[0]))

def create_image(arr, w, h):
    arr = np.reshape(arr, (h, w))
    data = np.zeros((h, w, 3), dtype=np.uint8)

    for i in range (h):
        for j in range (w):
            if (arr[i][j] == 0):
                data[i][j] = [255, 255, 255]
            else:
                data[i][j] = [0, 0, 0]

    img = Image.fromarray(data, 'RGB')
    img.save('element.png')

'-----------------------------------------------------------------------------------------------------------------------------------------'
def train_and_build():
    'loading image'
    image = Image.open("element.png").convert("L")

    'resizing to 28 height pixels'
    w = image.size[0]
    h = image.size[1]
    r = w / h # aspect ratio

    'image is resized to a height of 28 px (model input requirement). Keeping the same aspect ratio, the width is adjusted as well.'
    new_w = int(r * 28)
    new_h = 28
    new_image = image.resize((new_w, new_h))

    'converting to a numpy array'
    new_image_arr = np.array(new_image)

    'inverting the image to make background = 0. Black is 0. White is 255'
    new_inv_image_arr = 255 - new_image_arr

    'rescaling the image'
    final_image_arr = new_inv_image_arr / 255.0

    '''
    splitting image array into individual digit arrays using non zero columns
    Now the image array is split into individual element arrays.
    This is done by searching the image array for successive non zero columns (non black) and grouping them to form one element array.
    These element arrays are all stored in one list. If there are 14 elements in the mathematical expression, the size of the list will be 14.
    '''
    m = final_image_arr.any(0)
    out = [final_image_arr[:,[*g]] for k, g in groupby(np.arange(len(m)), lambda x: m[x] != 0) if k]

    '''
    iterating through the digit arrays to resize them to match input 
    criteria of the model = [mini_batch_size, height, width, channels]
    '''
    num_of_elements = len(out)
    elements_list = []
    '''
    In order to identify the element using the model, it is important to have the image size of 28px*28px. The height is already 28px.
    However, due to the splitting process, the width of each element is not exactly 28px.
    Therefore, after the splitting, the width of each element is adjusted to 28 px. by adding zero value columns (filler columns) to the element arrays.
    '''
    for x in range(0, num_of_elements):
        img = out[x]
        
        #adding 0 value columns as fillers
        width = img.shape[1]
        filler = (final_image_arr.shape[0] - width) / 2
        
        if filler.is_integer() == False:    #odd number of filler columns
            filler_l = int(filler)
            filler_r = int(filler) + 1
        else:                               #even number of filler columns
            filler_l = int(filler)
            filler_r = int(filler)
        
        arr_l = np.zeros((final_image_arr.shape[0], filler_l)) #left fillers
        arr_r = np.zeros((final_image_arr.shape[0], filler_r)) #right fillers
        
        #concatinating the left and right fillers
        help_ = np.concatenate((arr_l, img), axis= 1)
        element_arr = np.concatenate((help_, arr_r), axis= 1)
        
        element_arr.resize(28, 28, 1) #resize array 2d to 3d

        #storing all elements in a list
        elements_list.append(element_arr)


    elements_array = np.array(elements_list)

    'the elements list is converted back into an array of shape (14, 28, 28, 1) to fit the model input requirements of a 4D Tensor'
    elements_array = elements_array.reshape(-1, 28, 28, 1)

    'predicting using the model'
    # model = keras.models.load_model("model.h5")
    model = keras.models.load_model("/home/admin/Desktop/385_Final_Project/model.h5")
    elements_pred =  model.predict(elements_array)

    'The class with the highest probability is chosen.'
    elements_pred = np.argmax(elements_pred, axis = 1)
    return elements_pred

def math_expression_generator(arr):
    op = {
              10,   # = "/"
              11,   # = "+"
              12,   # = "-"
              13    # = "*"
                  }   
    
    'creating a list separating all elements'
    'm_exp would become [9, 8], 10, [7, 6], 13, [5, 4], 11, [3, 2], 12, [1, 0]] --> 98 / 76 * 54 + 32 - 10 = 91.63'
    m_exp = []
    temp = []
    for item in arr:
        if item not in op:
            temp.append(item)
        else:
            m_exp.append(temp)
            m_exp.append(item)
            temp = []
    if temp:
        m_exp.append(temp)
    
    'converting the elements to numbers and operators'
    'so things like [9, 8] in m_exp are converted to the number 98'
    i = 0
    num = 0
    for item in m_exp:
        if type(item) == list:
            if not item:
                m_exp[i] = ""
                i = i + 1
            else:
                num_len = len(item)
                for digit in item:
                    num_len = num_len - 1
                    num = num + ((10 ** num_len) * digit)
                m_exp[i] = str(num)
                num = 0
                i = i + 1
        else:
            m_exp[i] = str(item)
            m_exp[i] = m_exp[i].replace("10","/")
            m_exp[i] = m_exp[i].replace("11","+")
            m_exp[i] = m_exp[i].replace("12","-")
            m_exp[i] = m_exp[i].replace("13","*")
            
            i = i + 1
    
    
    'joining the list of strings to create the mathematical expression'
    separator = ' '
    m_exp_str = separator.join(m_exp)
    
    return (m_exp_str)

'-----------------------------------------------------------------------------------------------------------------------------------------'
m_exp_str = ""
GPIO.output(raspReadyOutputPin, 0)
output_to_fpga(0)

def if_integer(string):
	print(string[0])
	

while True:
    # try:
    if (GPIO.input(restartInputPin) == 1):
        m_exp_str = ""
        GPIO.output(raspReadyOutputPin, 0)
        output_to_fpga(0)

    elif (GPIO.input(charDoneInputPin) == 1):
        output_to_fpga(0)
        GPIO.output(raspReadyOutputPin, 0)
        'recording data from fpga'
        data = record_data()

        'create image from data'
        create_image(data, 640, 480)

        'Building and Training CNN Model'
        predictions = train_and_build()

        'creating the mathematical expression'
        predicted = math_expression_generator(predictions).replace(" ", "")
        m_exp_str += predicted

        while(1):
            if (GPIO.input(charDoneInputPin) == 0): break

        print("Char Recognition Done")
        print(m_exp_str)
        # output_to_fpga(int('7FFFC', 16))

        is_int = False

        if (predicted[0] == '-'):
            is_int = predicted[1:].isdigit()
        else:
            is_int = predicted.isdigit()

        if(is_int == True):
            num = int(predicted)
            if(num < 0):
                num = -num
                output_to_fpga(num)
                GPIO.output(outputPin19, 1)
            else:
                output_to_fpga(num)
        else:
            output_to_fpga(0)

        GPIO.output(raspReadyOutputPin, 1)
        time.sleep(1)
        GPIO.output(raspReadyOutputPin, 0)
        output_to_fpga(0)

    elif (GPIO.input(solveInputPin) == 1 and m_exp_str != ""):
        'calculating the mathematical expression using eval()'
        answer = eval(m_exp_str)    #evaluating the answer
        time.sleep(1)
        print(answer)
        answer = round(answer)
        
        m_exp_str = ""
        
        if(answer < 0):
            answer = -answer
            output_to_fpga(answer)
            GPIO.output(outputPin19, 1)
        else:
            output_to_fpga(answer)

        GPIO.output(raspReadyOutputPin, 1)
        time.sleep(0.1)

        while(1):
            if (GPIO.input(solveInputPin) == 0): break

    # except Exception:
    #     m_exp_str = ""
    #     GPIO.output(raspReadyOutputPin, 1)
    #     output_to_fpga(int('7FFFF', 16))
    #     print("Expression cannot be predicted")
