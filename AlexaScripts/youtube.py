#!/usr/bin/python3
import time
from webbot import Browser

def get_url(n):
    pref = "https://www.youtube.com/results?search_query="
    return pref+n.replace(" ", '+')

s = open("D:\\Desktop\\HeNeos\\AlexaScripts\\url.txt", "r")
s = get_url(s.read())

web = Browser()
web.go_to(s)

time.sleep(1.0)

web.press(web.Key.TAB)
time.sleep(0.5)
web.press(web.Key.ENTER)