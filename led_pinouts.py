import board
import digitalio

yellowled_pin = 18
redled_pin = 17
greenled_pin = 27
blueled_pin = 26

# Activity LED
yellowled = digitalio.DigitalInOut(board.D18)

# Status LED
redled = digitalio.DigitalInOut(board.D17)
greenled = digitalio.DigitalInOut(board.D27)
blueled = digitalio.DigitalInOut(board.D26)

# How do i print these pinouts?


def dirty_pinout_printer():
	print(f"ACTIVITY LED PIN: {yellowled_pin}")
	print(f"RED LED PIN: {redled_pin}")
	print(f"GREEN LED PIN: {greenled_pin}")
	print(f"BLUE LED PIN: {blueled_pin}")


# dirty_pinout_printer() sucks. 
# I need a way to print the value of the pin from the value of 
# the pins from redled, greenled, etc. variables.
