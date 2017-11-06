#!/usr/bin/python

import os
import time

def measure_temp():
    temp = os.popen("vcgencmd measure_temp").readline()
    return (temp.replace("temp=",""))
    
def Temp():
    global maxTemp
    global temps

    t = os.popen("vcgencmd measure_temp").readline()
    c=float(t.replace("temp=","").replace("'C\n",""))
    
    if c > maxTemp:
        maxTemp = c
        
    temps.append(float(c))
    minuteTemps = temps[-60:]
    temps = hourTemps = temps[-3600:]
    
    minuteAvg = "{0:.1f}".format(float(sum(minuteTemps))/len(minuteTemps))
    hourAvg = "{0:.1f}".format(float(sum(hourTemps))/len(hourTemps))
    #f=round(9.0/5.0*int(float(c))+32,1)
    #print("\nTemp= "+str(f)+" F\n\n"+"Temp= "+str(c)+" C\n")
    print("Temp= "+str(c)+" C Avg= "+str(minuteAvg)+" C (" +str(hourAvg)+" C) Max= "+str(maxTemp)+ " C ("+str(max(temps))+" C)")

temps = []
maxTemp = float(0)

while True:
        Temp()
        time.sleep(1)