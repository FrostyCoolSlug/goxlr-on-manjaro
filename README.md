# GoXLR on Linux Configuration

*This was developed on, and tested with Manjaro Plasma 21.2.2*

**Note: This is experimental, please check out the main [goxlr-on-linux repository](https://github.com/GoXLR-on-Linux/goxlr-on-linux) for a better tested method**

This is currently only known to be working on Manjaro, it differs slightly from existing scripts in that it focuses
on using systemd and pulse directly to implement functionality, which should provide better reliability and additional
features.

# Fetching
Copy the files in this repository into `/usr/share/goxlr`

# Prerequisites
Under Manjaro, you'll need to install Jack and associated tools:

`sudo pacman -S jack2 jack2-dbus pulseaudio-jack jack-example-tools`

In addition, the `alsa-card-profiles` package may include a (currently) not working profile for the GoXLR, this needs
to be removed (note, that updates to this package may restore the profile).

`sudo sed -i '/If.goxlr {/,+7 d' /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf`

# Fetching
Copy the files in this repository into `/usr/share/goxlr`

# Installation

- Add your user to the 'audio' group (if not present)

`sudo gpasswd -a <user> audio`

- Configure Limits to solve memory issue..

`sudo cp 20-audio.conf /etc/security/limits.d`

- Link the systemd modules:

`sudo ln -s /usr/share/goxlr/systemd/* /etc/systemd/user`

- Install the PulseAudio Channel Profile..

`sudo mkdir -p /etc/pulse/default.pa.d/`  
`sudo ln -s /usr/share/goxlr/configure-goxlr.pa /etc/pulse/default.pa.d/`

- Globally enable the systemd units..

`sudo systemctl --global enable goxlr-prepare.service goxlr-connect.service`  

Reboot, the GoXLR should begin working immediately on login.

# TODOs:
* Mutli-User Support
* Mutli-Device Support
