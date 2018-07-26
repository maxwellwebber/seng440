#define l 4
#define w 4
#define cl 2
#define cw 2
#include <stdio.h>
#include <sys/time.h>
unsigned char r[l][w] = {{255,255,255,255},
		{255,255,255,255},
		{255,255,255,255},
		{255,255,255,255}};
unsigned char g[l][w] = {{0,0,0,0},
		{0,0,0,0},
		{0,0,0,0},
		{0,0,0,0}};
unsigned char b[l][w] = {{1,1, 1, 1},
		{1,1, 1, 1},
		{1,1, 1, 1},
		{1,1, 1, 1}};
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
		}
	}	
}

void YCCtoRGB(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w], unsigned char y[l][w], unsigned char cr[cl][cw], unsigned char cb[cl][cw]){
	int i, j;
	unsigned int rval, gval, bval;
	unsigned int yval, crval, cbval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			yval = (int) y[i][j] << 8;
			crval = (int) cr[i/2][j/2] << 8;
			cbval = (int) cb[i/2][j/2] << 8;
			rval = 19071*(yval - 4096) + 26149*(crval - 32768) >> 22;
			gval = 19071*(yval - 4096) - 13320*(crval - 32768) - 6406*(cbval - 32768) >> 22;
			bval = 19071*(yval - 4096) + 33063*(cbval - 32768) >> 22;
			r[i][j] = rval > 1000 ? 0: rval;
			g[i][j] = gval > 1000 ? 0: gval;
			b[i][j] = bval > 1000 ? 0: bval;
		}
	}
	
}

long get_time(){
	//helper function to get the current timestamp in microseconds
	struct timeval currentTime;
	gettimeofday(&currentTime, NULL);
	return currentTime.tv_sec * (int)1e6 + currentTime.tv_usec;
}

int main(void){
	int i;
	time_t t1 = get_time();
	for (i = 0; i < 200000; i++) {
		RGBtoYCC(r,g,b,y,cr,cb);
		YCCtoRGB(r,g,b,y,cr,cb);
	}
	time_t t2 = get_time();
	long time = t2-t1;
	printf("%d\n",time);
	return 0;
}



