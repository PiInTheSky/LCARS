This is a Python 3 / PyQt4 application designed to simplify the process of chasing and locating a HAB flight, particularly if chasing single-crewed.

The user interface is inspired by the LCARS (Library Computer Access/Retrieval System) in Star Trek: The Next Generation.

The screen size and layout is designed specifically for the official Raspberry Pi touchscreen display.  It doesn't resize according the monitor,
so it will sit in the top-left corner on a large monitor, and be pretty much unusable on a smaller monitor.

The program runs quite happily on Linux (Raspbian tested) or Windows (W7 tested), except for the Linux-only parts (e.g. interfacing to Navit).

Functions
=========

Main functions are:

	Receive HAB telemetry from a LoRa gateway (JSON link to a socket on the gateway)
	Receive HAB telemetry from dl-fldigi (raw data link to a socket on the gateway)
	Receive HAB telemetry from Habitat (coming soon)
	Display telemetry and SSDV
	Voice alerts (e.g. "New telemetry from payload X")
	Receive position from GPSD
	Upload current position to Habitat
	Provide offline navigation to payload, with voice alerts

The program's main screen shows the following:

	Top status bar (list of payloads, position of selected payload)
	Bottom status bar (local GPS data, status of connections to LoRa gateway, dl-fldigi, Habitat, BATC, Chase car upload, internet connection)
	Main function buttons along the left
	Large central area for selected function
	

Main user functions are:

	PAYLOADS - Basic telemetry from up to 3 payloads
	HAB      - Altitude plot etc for selected payload
	CHASE    - Telemetry, distance and direction to selected payload
	SOURCE   - Displays the source - gateway or dl-fldigi - window
	NAV      - Opens Navit for navigation to the selected payload
	SSDV     - Shows images received locally by SSDV
	BATC     - Controls the camera (off / on / live streaming to BATC)
	SETTINGS - Settings for LCARS, LoRa gateway (in progress), dl-fldigi (soon)
	

Installation
============

Just save the repository to a suitable folder (e.g. /home/pi/LCARS).

There are many prerequisites - Python libraries and also external programs.

Python Libs
-----------

[to do]

Linux Utilities
---------------

sudo apt-get install wmctrl, screen, gnuplot, xterm


GPSD
----

Disable getty on serial port (raspi-config)

Install GPSD

Edit /etc/default/gpsd and set DEVICES="/dev/ttyAMA0"


Navit
-----

sudo apt-get install subversion imagemagick libdbus-1-dev libdbus-glib-1-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libimlib2-dev librsvg2-bin libspeechd-dev libxml2-dev ttf-liberation libgtk2.0-dev

sudo apt-get install gcc g++ cmake make zlib1g-dev libpng12-dev librsvg2-bin

sudo apt-get install libsdl-image1.2-dev libdevil-dev libglc-dev freeglut3-dev libxmu-dev libfribidi-dev

sudo apt-get install libglc-dev freeglut3-dev libgl1-mesa-dev libfreeimage-dev

sudo apt-get install libqt4-dev

sudo apt-get install libgps-dev

sudo apt-get install espeak

svn co svn://svn.code.sf.net/p/navit/code/trunk/navit/ navit

mkdir navit-build
cd navit-build

cmake ~/navit -DFREETYPE_INCLUDE_DIRS=/usr/include/freetype2/

make -j4
	


Configuration
=============

The configuration is in the file lcars.txt, or use the Settings button.


Use
===

Run with:

	python3 lcars.py


Change History
==============

15/09/2016 - V1.0.1
-------------------

	Split settings into 4 groups
	Show units for MHz etc
	Added general settings for LoRa config
	Added channel settings for LoRa config
	Handle integer and floating point LoRa settings
	Handle list settings
	Set specific LoRa values from preset modes
	

14/09/2016 - V1.0.0
-------------------

	Single huge source code file needs sorting out
	No Habitat yet
	Mapping only via Navit - hoping to add Mapnik soon
	Installation instructions need finishing

	