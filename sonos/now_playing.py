import sys
import time
from soco import SoCo
from soco.discovery import by_name
import soco

# get list of devices
devices = []
for zone in soco.discover():
    devices.append(zone.player_name)
devices.sort()

# ask user for device to use
print("Get play info from which device?")
for zone in devices:
    print(str(devices.index(zone)+1) + ":", zone)
selected_device = devices[int(input("? "))-1]
device = by_name(selected_device)

# functions for getting track info
def track_name(info):
    return "%s - %s" % (info["artist"], info["title"])
def track_position(info):
    return "%s/%s" % (info["position"], info["duration"])

print("\nNow playing on %s:" % selected_device)
while (1 == 1):
    info = device.get_current_track_info()
    sys.stdout.write("[%s] %s\r" % (track_position(info), track_name(info)))
    time.sleep(0.2)
