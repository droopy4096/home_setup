#!/usr/bin/python
import sys
import xml.etree.ElementTree as ET

xmldata=sys.stdin.read()
root = ET.fromstring(xmldata)
results=root.findall(sys.argv[1])

for r in results:
    print r.text
