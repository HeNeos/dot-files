import math
import sys
import screen_brightness_control as sbc

def dual_brightness(brightness):
    first_brightness = min(max(0, brightness), 100)
    # ax^2+bx+c
    c = 0
    b = 14/9
    a = (1-b)/100
    second_brightness = int(math.floor(a*first_brightness**2 + b*first_brightness + c))
    second_brightness = min(max(0, second_brightness), 100)
    return (first_brightness, second_brightness)
    
def main(*args, **kwargs):
    brightness = list(map(lambda x: int(x), args))
    if len(brightness) == 0:
        brightness = [50]
    if len(brightness) == 1:
        brightness = dual_brightness(brightness[0])
    for i in range(len(brightness)):
        sbc.set_brightness(brightness[i], i)

if __name__ == "__main__":
    main(*sys.argv[1:])
