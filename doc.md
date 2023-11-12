# ESP8266 Micropython

Install micropython on esp8266 board

## environment

### python

- version >= 3.6
- 64 bit

### libraries & venv

#### install pipenv - venv manager

```bash
pip install pipenv==2023.10.24
```

#### activate venv

```bash
pipenv shell
```

#### install libraries

```bash
pipenv install
```

## firmware

### file

```bash
curl -o https://micropython.org/resources/firmware/ESP8266_GENERIC-20231005-v1.21.0.bin esp8266_latest.bin
```

### get device com port

run command and look for tty serial devices, get for board

```bash
ls /dev/ | grep serial
```

### flash script

```bash
./flash.sh /dev/tty.usbserial 115200 esp2866_generic_v1.21.0.bin
```

> Caution: it will erase the flash contents. remove `--erase-all` from script

### instructions

- [installation](https://docs.micropython.org/en/latest/esp8266/tutorial/intro.html#deploying-the-firmware)
- [doc](https://docs.micropython.org/en/latest/index.html)
- [examples](https://micropython-on-esp8266-workshop.readthedocs.io/en/latest/setup.html)

> Below mentioned tools are included in dependencies, no need to install them separately.

## tools

### ampy

Utility to interact with a CircuitPython or MicroPython board over a serial connection

#### ls command on board's filesystem

```bash
ampy -p /dev/cu.usbserial -b 115200 ls
```

[library](https://pypi.org/project/ampy)

[doc](https://ampy.readthedocs.io/en/latest)

### rshell

Remote MicroPython shell

This is a simple shell which runs on the host and uses MicroPython’s raw-REPL to send python snippets to the pyboard in order to get filesystem information, and to copy files to and from MicroPython’s filesystem.

Easier to install & works cross platform (python).

#### connect to board

```bash
rshell --buffer-size=30 -p /dev/cu.usbserial-0001 -a
```

#### get board's shell

```bash
repl
```

#### sync files from host to board

```bash
rsync ./src /pyboard
```

[library](https://pypi.org/project/rshell)

[doc](https://github.com/dhylands/rshell)

### picocom

Picocom is a minimal dumb-terminal emulation program that is great for accessing a serial port based Linux console.

```bash
picocom -r -l /dev/ttyUSB0 -b 115200
```

[doc](https://developer.ridgerun.com/wiki/index.php/Setting_up_Picocom_-_Ubuntu)

> Note: Install picocom or rshell, both if you want different tools for serial communication.

### vscode extension

```bash
code --install-extension dphans.micropython-ide-vscode
```

## Refs

1. [Upload code](https://pythonforundergradengineers.com/upload-py-files-to-esp8266-running-micropython.html)
2. [Ampy](https://blog.glugmvit.com/getting-started-with-ampy)
3. [Linux](https://github.com/raspiduino/uARM8266)
4. [Board design](https://www.tinkercad.com)
