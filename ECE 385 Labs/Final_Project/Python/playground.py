import RPi.GPIO as GPIO
import time

#Pin Definitions
processPIN = 4 #3
donePIN = 27 #5
inputPin = 22 #7

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(processPIN, GPIO.OUT)
GPIO.setup(donePIN, GPIO.OUT)
GPIO.setup(inputPin, GPIO.IN)


while(1):
    last = GPIO.input(inputPin)
    print(last)
    if (last):
        time_end = time.time() + 3
        while(time.time() < time_end): 
            GPIO.output(processPIN, GPIO.HIGH)
            time.sleep(0.25)
            GPIO.output(processPIN, GPIO.LOW)
            time.sleep(0.25)
        GPIO.output(donePIN, GPIO.HIGH)
        while(1):
            if (last != GPIO.input(inputPin)): break
    else:
        GPIO.output(donePIN, GPIO.LOW)
        GPIO.output(processPIN, GPIO.LOW)
        while(1):
            if (last != GPIO.input(inputPin)): break