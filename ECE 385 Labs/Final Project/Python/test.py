import RPi.GPIO as GPIO

# def button_callback(channel):
#     print("Button was pushed!")
#     print(channel)

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

# GPIO.setup(10, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
# GPIO.add_event_detect(10, GPIO.RISING, callback = button_callback)
# message = input("Press enter to quit\n\n")

# GPIO.cleanup()

import spidev
import time

def button_callback(channel):
    print("HELLO!")

spi = spidev.SpiDev()
spi.open(0, 0)
spi.max_speed_hz = 1

GPIO.setup(4, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
GPIO.add_event_detect(4, GPIO.RISING, callback = button_callback)

spi.writebytes([0x3A])

