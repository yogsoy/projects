from tkinter import *
from tkinter import ttk
import time
from soco import SoCo
from soco.discovery import by_name
import soco

# create gui window
root = Tk()

marginal = StringVar(root)
marginal.set("Nothing Playing")
now_playing = ttk.Label(root, textvariable=marginal).pack()

def start_now_playing():
    print(device_first.get())
    device = by_name(device_first.get())
    if (device):
        info = device.get_current_track_info()
        marginal.set(track_position(info) + " " + track_name(info))
        print(marginal.get())

def track_name(info):
    return "%s - %s" % (info["artist"], info["title"])
def track_position(info):
    return "[%s/%s]" % (info["position"], info["duration"])

ttk.Label(root, text="Devices:").pack()

# get list of devices
devices = []
for zone in soco.discover():
    devices.append(zone.player_name)
devices.sort()

device_first = StringVar()
for red in devices:
    aaa = ttk.Radiobutton(root, text=red, variable=device_first, value=red)
    aaa.pack()
    print(red)

ttk.Button(text="Select", command=start_now_playing).pack()

root.mainloop()
