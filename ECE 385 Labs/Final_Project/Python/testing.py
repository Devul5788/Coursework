import numpy as np 
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

while(1):
    output_to_fpga(int('7FFFF', 16))