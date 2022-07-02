import os

brightness=float(float(os.system('xbacklight -get'))/100)
print(brightness)
