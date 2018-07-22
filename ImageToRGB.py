#use with python 3
# this script will take a ppm file as input and pre-append the r, g and b structs along with the l, w, cl and cw macros
# at the beginning of the specified c file. if the file does not exist a new one will be created with the macros.

import sys
from PIL import Image;
print(sys.argv)
if (len(sys.argv) < 3 or len(sys.argv) > 3):
  print("usage: \npy ImageToRGB.py <input PPM file> <output c file>\n")
  print("\tthis script will take an image file as input and write the r, g and b structs along with the l, w, cl and cw macros\n\
\tto the specified output file.")

im = Image.open(sys.argv[1])
px = im.load()
height = im.height
width = im.width
if (height % 2 == 1): 
	height = height-1
if (width % 2 == 1): 
	width = width-1
#print("#define l "+str(height))
#print("#define w "+str(width))
#print("#define cl "+str(int(height/2)))
#print("#define cw "+str(int(width/2)))
headers = "#define l "+str(height)+"\n#define w "+str(width)+"\n#define cl "+str(int(height/2))+"\n#define cw "+str(int(width/2))+"\n"
r = "unsigned char r[l][w] = \t{{"
g = "unsigned char g[l][w] = \t{{"
b = "unsigned char b[l][w] = \t{{"

for y in range(height):
	for x in range(width):
		if (y == height-1 and x == width-1):
			r += str(px[x,y][0])+"}};\n"
		elif (x == width-1):
			r  += str(px[x,y][0])+"},\n\t\t\t\t{"
		else:	
			r  += str(px[x,y][0])+","
#print(r);

for y in range(height):
	for x in range(width):
		if (y == height-1 and x == width-1):
			g += str(px[x,y][1])+"}};\n"
		elif (x == width-1):
			g  += str(px[x,y][1])+"},\n\t\t\t\t{"
		else:	
			g  += str(px[x,y][1])+","
#print(g);

for y in range(height):
	for x in range(width):
		if (y == height-1 and x == width-1):
			b += str(px[x,y][2])+"}};\n"
		elif (x == width-1):
			b  += str(px[x,y][2])+"},\n\t\t\t\t{"
		else:	
			b  += str(px[x,y][2])+","
#print(b);
fout = open(sys.argv[2],"w")
fout.write(headers+r+g+b)
fout.close;


