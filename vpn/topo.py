import re
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--isis", action="store_true", help="Create IS-IS config")
parser.add_argument("--bgp", action="store_true", help="Create basic BGP config")
parser.add_argument("--rr", action="store_true", help="Create route reflector config")
parser.add_argument("--sr", action="store_true", help="Create segment routing config")

args = parser.parse_args()

text = ""
with open("vpn.clab.yml", "r") as file:
    text = file.read()

pattern = "[0-9]*-*configs[a-zA-Z0-9]*/"

replace = "configs/"

if (args.isis):
    replace = "01-configs-isis/"
elif (args.bgp):
    replace = "02-configs-bgp/"
elif (args.rr):
    replace = "03-configs-rr/"
elif (args.sr):
    replace = "04-configs-sr/"

text = re.sub(pattern, replace, text)

with open("out.clab.yml", "w") as file:
    file.write(text)

