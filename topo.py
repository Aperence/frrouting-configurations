import re
import argparse

parser = argparse.ArgumentParser()

parser.add_argument("--isis", help="Create IS-IS config")
parser.add_argument("--bgp", help="Create basic BGP config")
parser.add_argument("--rr", help="Create route reflector config")
parser.add_argument("--sr", help="Create segment routing config")

args = parser.parse_args()

text = ""
with open("vpn.clab.yml", "r") as file:
    text = file.read()

pattern = "configs[a-zA-Z0-9]*/"

replace = "configs/"

if (args.isis):
    replace = "configs-isis/"
elif (args.bgp):
    replace = "configs-bgp/"
elif (args.rr):
    replace = "configs-rr/"
elif (args.sr):
    replace = "configs-sr/"

text = re.sub(pattern, replace, text)

with open("out.clab.yml", "w") as file:
    file.write(text)

