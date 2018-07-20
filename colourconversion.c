#define l 2
#define w 4
#define cl 1
#define cw 2
#include <stdio.h>
float r[l][w] = {{128.0,128.0,128.0,128.0},
		{128.0,128.0,128.0,128.0}};
float g[l][w] = {{128.0,128.0,128.0,128.0},
		{128.0,128.0,128.0,128.0}};
float b[l][w] = {{0.0,0.0, 0.0, 0.0},
		{0.0,0.0, 0.0, 0.0}};
float y[l][w];
float cr[cl][cw];
float cb[cl][cw];

void RGBtoYCC(float r[l][w], float g[l][w], float b[l][w], float y[l][w], float cr[cl][cw], float cb[cl][cw]){
	int i, j;
	float rval, gval, bval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			rval = r[i][j];
			gval = g[i][j];
			bval = b[i][j];
			y[i][j] = 16.0 + 0.257*rval + 0.504*gval + 0.098*bval;
			cr[i/2][j/2] += 128.0 + 0.439*rval - 0.368*gval - 0.071*bval;
			cb[i/2][j/2] += 128.0 - 0.148*rval - 0.291*gval + 0.439*bval;

			if (i % 2 == 1 && j % 2 == 1){
				cr[i/2][j/2] = cr[i/2][j/2]/4;
				cb[i/2][j/2] = cb[i/2][j/2]/4;
			}
		}
	}	
}

void YCCtoRGB(float r[l][w], float g[l][w], float b[l][w], float y[l][w], float cr[cl][cw], float cb[cl][cw]){
	int i, j;
	float yval, crval, cbval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			yval = y[i][j];
			crval = cr[i/2][j/2];
			cbval = cb[i/2][j/2];
			r[i][j] = 1.164*(yval - 16) + 1.596*(crval - 128);
			g[i][j] = 1.164*(yval - 16) - 0.813*(crval - 128) - 0.391*(cbval - 128);
			b[i][j] = 1.164*(yval - 16) + 2.018*(cbval - 128);
		}
	}
	
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
	print_values(r,g,b);
	RGBtoYCC(r,g,b,y,cr,cb);
	YCCtoRGB(r,g,b,y,cr,cb);
	printf("\n");
	print_values(r,g,b);
	return 0;
}



