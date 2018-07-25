#define l 4
#define w 4
#define cl 2
#define cw 2
#include <stdio.h>
unsigned char r[l][w] = {{128,128,128,128},
		{128,128,128,128},
		{128,128,128,128},
		{128,128,128,128}};
unsigned char g[l][w] = {{128,128,128,128},
		{128,128,128,128},
		{128,128,128,128},
		{128,128,128,128}};
unsigned char b[l][w] = {{0,0, 0, 0},
		{0,0, 0, 0},
		{0,0,0,0},
		{0,0,0,0}};
unsigned char y[l][w];
unsigned char cr[cl][cw];
unsigned char cb[cl][cw];

void RGBtoYCC(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w], unsigned char y[l][w], unsigned char cr[cl][cw], unsigned char cb[cl][cw]){
	int i, j;
	unsigned int rval, gval, bval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			//scale to 16 bit
			rval = (int) r[i][j] << 8;
			gval = (int) g[i][j] << 8;
			bval = (int) b[i][j] << 8;
			y[i][j] = 4096 + (16843*rval + 33030*gval + 6423*bval >> 16) + 128 >> 8;
			cr[i/2][j/2] += 32768 + (28770*rval - 24117*gval - 4653*bval >> 16) + 512 >> 10;
			cb[i/2][j/2] += 32768 - (9699*rval + 19071*gval - 28770*bval >> 16) + 512 >> 10;

//			if (i % 2 == 1 && j % 2 == 1){
//				cr[i/2][j/2] = crtmp/4;
//				cb[i/2][j/2] = cbtmp/4;
//				crtmp = cbtmp = 0;
//			}
		}
	}	
}

void YCCtoRGB(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w], unsigned char y[l][w], unsigned char cr[cl][cw], unsigned char cb[cl][cw]){
	int i, j;
	unsigned int yval, crval, cbval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			yval = (int) y[i][j] << 8;
			crval = (int) cr[i/2][j/2] << 8;
			cbval = (int) cb[i/2][j/2] << 8;
			r[i][j] = 19071*(yval - 4096) + 26149*(crval - 32768) >> 22;
			g[i][j] = 19071*(yval - 4096) - 13320*(crval - 32768) - 6406*(cbval - 32768) >> 22;
			b[i][j] = 19071*(yval - 4096) + 33063*(cbval - 32768) >> 22;
		}
	}
	
}

void create_ppm_file(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w])
{
	FILE *fp;
	int i,j;
	fp = fopen("out.ppm","w");
	fwrite("P6 ",1,3,fp);
	char str[15];
	int size = 6;
	if (l < 10) size += 1;
	else if (l < 100) size += 2;
	else if (l < 1000) size += 3;
	else if (l < 10000) size += 4;
	if (w < 10) size += 1;
	else if (w < 100) size += 2;
	else if (w < 1000) size += 3;
	else if (w < 10000) size += 4;
	sprintf(str,"%d %d %d\n",w,l,255);
	fwrite(str,1,size,fp);
	for (i = 0; i < l; i++) {
		for (j = 0; j < w; j++) {
			fwrite(&(r[i][j]),1,1,fp);
			fwrite(&(g[i][j]),1,1,fp);
			fwrite(&(b[i][j]),1,1,fp);
		}
	}
	fclose(fp);

}

void print_values(float r[l][w],float g[l][w],float b[l][w])
{
	/*print function to be used for debugging purposes only*/
	int i, j;
	for (i = 0; i < l; i++) 
	{
		for (j = 0; j < w; j++) 
		{
			printf("{%.3f %.3f %.3f} ", r[i][j],g[i][j],b[i][j]);
		}	
		printf("\n");
	}
}
int main(void){
//	print_values(r,g,b);
	RGBtoYCC(r,g,b,y,cr,cb);
	YCCtoRGB(r,g,b,y,cr,cb);
//	printf("\n");
//	print_values(r,g,b);

	create_ppm_file(r,g,b);
	return 0;
}



