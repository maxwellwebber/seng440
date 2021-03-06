#include <stdio.h>
#include <sys/time.h>

#include "nature.h"

unsigned char y[l][w];
unsigned char cr[cl][cw];
unsigned char cb[cl][cw];

//void print_values(unsigned char r[l][w],unsigned char g[l][w],unsigned char b[l][w]);
unsigned char interpolate(unsigned char c[cl][cw], int i, int j);
unsigned char clamp(unsigned int val);
long get_time();

void RGBtoYCC(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w], unsigned char y[l][w], unsigned char cr[cl][cw], unsigned char cb[cl][cw]){
	int i, j;
	unsigned int rval, gval, bval;
	for (i = 0; i < l; i++){
		for (j = 0; j < w; j++){
			//scale to 16 bit
			rval = (int) (r[i][j] < 12 ? 0 : r[i][j]) << 8;
			gval = (int) (g[i][j] < 12 ? 0 : g[i][j]) << 8;
			bval = (int) (b[i][j] < 12 ? 0 : b[i][j]) << 8;
			y[i][j] = 4096 + (16843*rval + 33030*gval + 6423*bval >> 16) >> 8;
			cr[i/2][j/2] += 32768 + (28770*rval - 24117*gval - 4653*bval >> 16) >> 10;
			cb[i/2][j/2] += 32768 - (9699*rval + 19071*gval - 28770*bval >> 16) >> 10;

			//if ((i == 254 && j == 874) ||(i == 227 && j == 992)) 
			//{
			//	printf("%d: %d %d %d -> %d %d %d -> %d %d %d\n",j,r[i][j],g[i][j],b[i][j],rval,gval,bval,y[i][j],cr[i/2][j/2],cb[i/2][j/2]);
			//}
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
			crval = (int) interpolate(cr,i,j)/*cr[i/2][j/2]*/ << 8;
			cbval = (int) interpolate(cb,i,j)/*cb[i/2][j/2]*/ << 8;
			rval = 19071*(yval - 4096) + 26149*(crval - 32768) >> 22;
			gval = 19071*(yval - 4096) - 13320*(crval - 32768) - 6406*(cbval - 32768) >> 22;
			bval = 19071*(yval - 4096) + 33063*(cbval - 32768) >> 22;
			r[i][j] =   clamp(rval);
			g[i][j] =   clamp(gval);
			b[i][j] =   clamp(bval);

			//if ((i == 254 && j == 874) ||(i == 227 && j == 992)) 
			//{
			//	printf("%d: %d %d %d -> %d %d %d -> %d %d %d -> %d %d %d\n",j,y[i][j],/*interpolate(cr,i,j)*/cr[i/2][j/2],/*interpolate(cb,i,j)*/ cb[i/2][j/2],yval,crval,cbval,rval,gval,bval,r[i][j],g[i][j],b[i][j]);
			//}
		}
	}
	
}

unsigned char interpolate(unsigned char c[cl][cw], int i, int j){

	int pixels = 0;
	int val = 0;
	if (i/2 > 0){
		val += c[i/2 - 1][j/2];
		pixels++;
	}
	if (i/2 < cl-1){
		val += c[i/2 + 1][j/2];
		pixels++;
	}
	if (j/2 > 0){
		val += c[i/2][j/2-1];
		pixels++;
	}
	if (j/2 < cw-1){
		val += c[i/2][j/2+1];
		pixels++;
	}
	val += c[i/2][j/2];
	pixels++;
	return val/pixels;
}
/*
void create_ppm_file(unsigned char r[l][w], unsigned char g[l][w], unsigned char b[l][w])
{
	FILE *fp;
	int i,j;
	fp = fopen("out.csv","w");
	fwrite("P6 ",1,3,fp);
	char str[15];
	
	int size = 5;
	if (l < 10) size += 1;
	else if (l < 100) size += 2;
	else if (l < 1000) size += 3;
	else if (l < 10000) size += 4;
	if (w < 10) size += 1;
	else if (w < 100) size += 2;
	else if (w < 1000) size += 3;
	else if (w < 10000) size += 4;
	sprintf(str,"%d %d %d",w,l,255);
	fwrite(str,1,size,fp);
	fputc('\n',fp);
	for (i = 0; i < l; i++) {
		for (j = 0; j < w; j++) {
			char str2[16] = "               ";
			sprintf(str2,"\n%3d, %3d, %3d",r[i][j],g[i][j],b[i][j]);
			fwrite(str2,1,14,fp);
		}
	}
	char str2[16] = " ";
	sprintf(str2,"\n");
	fwrite(str2,1,1,fp);
	fclose(fp);

}
*/
/*
void print_values(unsigned char r[l][w],unsigned char g[l][w],unsigned char b[l][w])
{
	//print function to be used for debugging purposes only
	int i, j;
	for (i = 0; i < l; i++) 
	{
		for (j = 0; j < w; j++) 
		{
			printf("{%d %d %d} ", r[i][j],g[i][j],b[i][j]);
		}	
		printf("\n");
	}
	printf("\n");
}
*/

unsigned char clamp(unsigned int val)
{
	if (val > 512) {
		return 0;
	} else if (val <= 512 && val > 255) {
		return 255;
	} else {
		return val;
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
	for (i = 0; i < 10; i++) {
		RGBtoYCC(r,g,b,y,cr,cb);
		YCCtoRGB(r,g,b,y,cr,cb);
		//create_ppm_file(r,g,b);
	}
	time_t t2 = get_time();
	long t3 = t2-t1;
	printf("%d\n",t3);
	return 0;
}



