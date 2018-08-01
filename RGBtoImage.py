
import sys
from PIL import Image;
print(sys.argv)

fin = open("out.csv","r")

firstline = fin.readline()
_,w,l,_ = firstline.split(" ")
_ = fin.readline()
im = Image.new("RGB", (int(w), int(l)), "white")
px = im.load()
for y in range(int(l)):
	for x in range(int(w)):
		s = fin.readline()
		r,g,b = [int(x[:-1]) for x in s.split(" ") if x]
		px[x,y] = (r,g,b)
	

im.save("final_image.jpg")

fin.close;


