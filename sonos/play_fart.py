from soco import SoCo
from soco.discovery import by_name

#lounge = SoCo("192.168.1.21")
deviceName = input("Sonos device name: ")
device = by_name(deviceName)

try:
    device.play_uri("https://cdn.discordapp.com/attachments/628853013628583956/666269273831899146/FART_REMIXED.wav")
except:
    print("Could not find device", deviceName)
