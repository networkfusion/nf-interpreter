

# Resources

for devcontainers:
https://github.com/mwinters-stuff/vscode-devcontainer-raspberrypi-pico/tree/main

for debugging improvements:
https://github.com/haneefdm/cortex-debug-samples/blob/master/blink2/.vscode/launch.json


# Windows Debug:

For devs running directly on a linux host, it has a few benefits. Unfortunately on windows it does mean that you need to setup Ubuntu on WSL2 correctly (with https://learn.microsoft.com/en-us/windows/wsl/connect-usb and https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers and Copy the file https://github.com/raspberrypi/openocd/blob/rp2040/contrib/60-openocd.rules to /etc/udev/rules.d etc.)

Note: From a powershell window (run as admin), the following commands are needed on USB connect:

`usbipd wsl list`
work out your device and then
`usbipd wsl attach --busid 2-2 --distribution Ubuntu-22.04`
changing the bus id and distribution as required.

