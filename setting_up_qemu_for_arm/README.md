# Setting Up QEMU for ARM on Ubuntu

This guide assumes you have ubuntu machine in my case I am using a virtual machine for the setup.

## Step 1: Download the Raspbian Image

Go to the [Raspbian images page](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/) and download the appropriate zip file.

![Raspbian Image](https://github.com/Shikha-code36/assembly-ARM-tutorial/blob/main/setting_up_qemu_for_arm/raspberry.png)

## Step 2: Extract the Image

Extract the downloaded zip file to obtain the `.img` file.

## Step 3: Download the Kernel

Visit the [qemu-rpi-kernel repository](https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie) and download the `kernel-qemu-4.4.34-jessie` file.

![Kernal Image](https://github.com/Shikha-code36/assembly-ARM-tutorial/blob/main/setting_up_qemu_for_arm/kernal.png)

## Step 4: Verify Your Files

Check all your files with the `ls` command in your terminal.

![File Image](https://github.com/Shikha-code36/assembly-ARM-tutorial/blob/main/setting_up_qemu_for_arm/ls.png)

## Step 5: Run QEMU with Raspbian

Run the following command, making sure to replace `/Documents/qmu_vms/` with the path to where your files are located:

```bash
qemu-system-arm -kernel /Documents/qmu_vms/kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda /Documents/qmu_vms/2017-04-10-raspbian-jessie.img -nic user,hostfwd=tcp::5022-:22 -no-reboot
```

*Note: Write your own path where necessary.*

This will open a Raspbian QEMU window.

## Step 6: Start SSH Service in QEMU

Open a terminal in QEMU and start the SSH service:

```bash
sudo service ssh start
```

![Pi Image](https://github.com/Shikha-code36/assembly-ARM-tutorial/blob/main/setting_up_qemu_for_arm/pi.png)

## Step 7: SSH into QEMU from Ubuntu Terminal

Open a new tab in your Ubuntu terminal and connect via SSH:

```bash
ssh pi@127.0.0.1 -p 5022
```

The default password is `raspberry`.

You are now logged into your QEMU virtual machine.
