import RPi.GPIO as GPIO
import time

restartInputPin = 12
charDoneInputPin = 16
solveInputPin = 20

'setting modes'
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(restartInputPin, GPIO.IN)
GPIO.setup(charDoneInputPin, GPIO.IN)
GPIO.setup(solveInputPin, GPIO.IN)

while(1):
    print(str(GPIO.input(restartInputPin)) + " " + str(GPIO.input(charDoneInputPin)) + " " + str(GPIO.input(solveInputPin)))
    time.sleep(1)