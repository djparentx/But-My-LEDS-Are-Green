#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    exec sudo -E "$0" "$@"
fi

	cat > /usr/local/bin/Change\ LED\ to\ Red.sh << 'EOF'
#!/bin/bash

#Ensure we can write to the LED gpio77
sudo chmod 777 /sys/class/gpio/export
echo 77 > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio77/direction
sudo echo out > /sys/class/gpio/gpio77/direction
sudo chmod 777 /sys/class/gpio/gpio77/value

#Set the LED color to red.
echo 1 > /sys/class/gpio/gpio77/value

#Change the battery life warning script to accomodate for this change
sudo cp -f -v /usr/local/bin/batt_life_warning.py.red /usr/local/bin/batt_life_warning.py
sudo systemctl daemon-reload
sudo systemctl restart batt_led

#Ensure that the LED is set back to RED on boot
sudo cp -f -v /usr/local/bin/fix_power_led.red /usr/local/bin/fix_power_led

#Change the LED script in the Option menu to allow switching back to Green
sudo cp /usr/local/bin/Change\ LED\ to\ Green.sh /opt/system/.
sudo rm /opt/system/Change\ LED\ to\ Red.sh
printf "\033c" >> /dev/tty1
sudo systemctl restart emulationstation
EOF

	cat > /usr/local/bin/Change\ LED\ to\ Green.sh << 'EOF'
#!/bin/bash

#Ensure we can write to the LED gpio77
sudo chmod 777 /sys/class/gpio/export
echo 77 > /sys/class/gpio/export
sudo chmod 777 /sys/class/gpio/gpio77/direction
sudo echo out > /sys/class/gpio/gpio77/direction
sudo chmod 777 /sys/class/gpio/gpio77/value

#Set the LED color to Green.
echo 0 > /sys/class/gpio/gpio77/value

#Change the battery life warning script to accomodate for this change
sudo cp -f -v /usr/local/bin/batt_life_warning.py.green /usr/local/bin/batt_life_warning.py
sudo systemctl daemon-reload
sudo systemctl restart batt_led

#Ensure that the LED is set back to Green on boot
sudo cp -f -v /usr/local/bin/fix_power_led.green /usr/local/bin/fix_power_led

#Change the LED script in the Option menu to allow switching back to Green
sudo cp /usr/local/bin/Change\ LED\ to\ Red.sh /opt/system/.
sudo rm /opt/system/Change\ LED\ to\ Green.sh
printf "\033c" >> /dev/tty1
sudo systemctl restart emulationstation
EOF


cp /usr/local/bin/Change\ LED\ to\ Red.sh /opt/system/.
rm -f /usr/local/bin/Change\ LED\ to\ Blue.sh

chmod 755 /opt/system/Change\ LED\ to\ Red.sh
chmod 755 /usr/local/bin/Change\ LED\ to\ Red.sh
chmod 755 /usr/local/bin/Change\ LED\ to\ Green.sh

echo "success!"
sleep 1

rm -f "$0"