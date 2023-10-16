import pyautogui
import time
import random
import math
import os
import numpy as np
from glob import glob

pyautogui.FAILSAFE = False

def get_ellipse(center, axes):
    # x^2/a^2 + y^2/b^2 = 1
    points = []
    normal = []
    for x in range(0, axes[0]+1, 4):
        temp = 1 - (x/axes[0])**2
        temp *= axes[1]*axes[1]
        normal.append([x, int(math.sqrt(temp))])

    for point in normal:
        points.append([point[0] + center[0], point[1] + center[1]])

    for point in normal[::-1]:
        points.append([point[0] + center[0], -point[1] + center[1]])

    normal = []

    for x in range(0, -axes[0]-1, -4):
        temp = 1 - (x/axes[0])**2
        temp *= axes[1]*axes[1]
        normal.append([x, -int(math.sqrt(temp))])

    for point in normal:
        points.append([point[0] + center[0], point[1] + center[1]])
    
    for point in normal[::-1]:
        points.append([point[0] + center[0], -point[1] + center[1]])

    return points

def move_mouse():
    # this will move the mouse forming a sequencial ellipse
    c_x = random.randrange(960+96, 960+2*96)
    c_y = random.randrange(540-54, 540+54)
    
    a = random.randrange(160, 450)
    b = random.randrange(60, 200)

    points = get_ellipse([c_x, c_y], [a, b])
    points = points[::32]

    for point in points:
        pyautogui.moveTo(point[0], point[1])

def write_text(text_file):
    with open(text_file, 'r') as f:
        for line in f:
            w = line.rstrip()
            pyautogui.write(w, interval=0.12)
            needs_move = (random.random() > 0.9)
            if needs_move:
                move_mouse()
                pyautogui.scroll(3)
                pyautogui.scroll(-3)
            pyautogui.press('enter')
    pyautogui.press('enter')


while True:
    time.sleep(10)
    dir = "C:\\Users\\PC\\icpc-team-notebook-el-vasito"
    files = glob(f"{dir}/**/*.cpp", recursive=True)
    sz = len(files)
    order = np.random.permutation(np.arange(0, sz))
    for i in order:
        index = int(i)
        write_text(files[index])