#!/usr/bin/python3
import time
from webbot import Browser

web = Browser()
web.go_to('http://www.earpunifim.com/')

time.sleep(0.5)

web.type("20174070I", into="Usuario UNI")
web.type("314159", into="Password")
web.press(web.Key.ENTER)

time.sleep(1)

web.go_to('http://www.earpunifim.com/departamento/asistencia/alumno')

time.sleep(1)

pref = "body > div.mdl-layout__container > div > main > div > div > section > div > div.table-responsive > table > tbody > tr"
mid = ":nth-child("
suff = " > td:nth-child(9) > button.mdl-button.mdl-js-button.mdl-button--raised.mdl-js-ripple-effect.btnMarcar.mdl-button--colored"

for i in range(1, 9):
    text1 = pref+suff
    text2 = pref + mid + str(i) + ")" + suff
    if web.exists(css_selector = text1):
        web.click(css_selector = text1)
        break
    if web.exists(css_selector = text2):
        web.click(css_selector = text2)
    time.sleep(0.5)

web.click(css_selector = "body > div.mdl-layout__container > div > main > div > div > section > div > div.mb-1.mt-3 > button:nth-child(2) > span", number = 3)

time.sleep(0.5)

for i in range(1, 9):
    text1 = pref+suff
    text2 = pref + mid + str(i) + ")" + suff
    if web.exists(css_selector = text1):
        web.click(css_selector = text1)
        break
    if web.exists(css_selector = text2):
        web.click(css_selector = text2)
    time.sleep(0.5)


web.quit()