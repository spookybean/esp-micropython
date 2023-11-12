import time

import machine
from machine import Pin

machine.freq(machine.freq())

led = Pin(2, Pin.OUT)

while True:
    led.off()
    time.sleep(0.5)
    led.on()
    time.sleep(0.5)
