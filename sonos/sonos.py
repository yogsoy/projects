from soco import SoCo
import soco

zones = soco.discover()

#print("Player zones:")
for zone in zones:
    print(zone.player_name + ":\n  IP: " + zone.ip_address + "\n  Playing:", SoCo(zone.ip_address).get_current_track_info(),"\n")


