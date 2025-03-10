# RUN THIS FILE BEFORE ATTEMPTING TO BUILD THE WS
sudo dpkg -i livox-sdk_20240719-1_arm64.deb
sudo dpkg -i g2o_20240719-1_arm64.deb
cp bringup_launch_mid360.py ~/f1tenth_ws/src/f1tenth_system/f1tenth_stack/launch/
echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib' >> ~/.bashrc
nmcli connection add type ethernet ifname eth0 con-name Livox ip4 192.168.1.5/24 gw4 192.168.1.1
nmcli con modify Livox ipv4.never-default yes
echo "Add the Lidar IP to livox_ros_driver2/config/MID360_config.json by substituting XX from the last two numbers of the Lidar's serial number"
# build this ws from its base directory: colcon build
# build the f1tenth stack from ~/f1tenth_ws: colcon build --packages-select f1tenth_stack
