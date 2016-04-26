#!/bin/bash
git clone https://github.com/samhitha30/Sensor-app.git /application
cd /application
unzip sensor.zip
cp -r /application/sensor/platforms/android/build/outputs/apk /application
#git init
#git add .
#git commit -m "First commit"
#git remote add testt https://github.com/samhitha30/Sensor-app.git
#git push -f testt master
cd /application/sensor
ionic serve -a

#if(curl http://52.63.237.171:8100); then echo"Successful"; else echo"Failed"; 
#fi
