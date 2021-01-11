#include "bsp_sd.h"

/*
 * Global variable
 */

static FIL fil;		/* File object */
static FATFS fatfs;

//SD³õÊ¼»¯º¯Êý
int SD_Init()
{
	FRESULT res;
	res = f_mount(&fatfs, "0:/", 0);
	if (res != FR_OK)
	{
		printf("mount drive failed!\t\n");
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

//Ð´SD¿¨º¯Êý
void Write2SD()
{
	unsigned int br;
	FRESULT res;
	XTime TimerStart, TimerEnd;
	float elapsed_time ;
	char filename[128];

	sprintf(filename,"data.bin");

	printf("Start writing data to SD!\t\n");
	XTime_SetTime(0) ;
	XTime_GetTime(&TimerStart) ;
	res = f_open(&fil, filename, FA_CREATE_ALWAYS | FA_WRITE);
	if(res != FR_OK)
	{
		printf("file open failed!\t\n");
		return ;
	}

	res = f_write(&fil, (const void *)READ_ADDR_0, BYTE_NUM, &br) ;
	f_close(&fil);

	XTime_GetTime(&TimerEnd) ;
	elapsed_time = ((float)(TimerEnd-TimerStart))/((float)COUNTS_PER_SECOND) ;
	printf("%s write complete.\tINFO:Elapsed time = %.2f sec\r\n",filename,elapsed_time);

};


//¶Ásd¿¨

int SD_Transfer_read(char *FileName, u32 DestinationAddress, u32 ByteLength) {
    FIL fil;
    FRESULT rc;
    UINT br;

    rc = f_open(&fil, FileName, FA_READ);
    if (rc) {
        xil_printf("ERROR:f_open returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_lseek(&fil, 0);
    if (rc) {
        xil_printf("ERROR:f_open returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_read(&fil, (void*) DestinationAddress, ByteLength, &br);
    if (rc) {
        xil_printf("ERROR:f_open returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_close(&fil);
    if (rc) {
        xil_printf("ERROR:f_open returned %d\r\n", rc);
        return XST_FAILURE;
    }
    return XST_SUCCESS;
}

//Ð´sd¿¨
int SD_Transfer_write(char *FileName, u32 SourceAddress, u32 ByteLength) {
    FIL fil;
    FRESULT rc;
    UINT bw;

    rc = f_open(&fil, FileName, FA_CREATE_ALWAYS | FA_WRITE);
    if (rc) {
        xil_printf("ERROR : f_open returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_lseek(&fil, 0);
    if (rc) {
        xil_printf("ERROR : f_lseek returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_write(&fil, (void*) SourceAddress, ByteLength, &bw);
    if (rc) {
        xil_printf("ERROR : f_write returned %d\r\n", rc);
        return XST_FAILURE;
    }
    rc = f_close(&fil);
    if (rc) {
        xil_printf("ERROR : f_close returned %d\r\n", rc);
        return XST_FAILURE;
    }

    printf("Start writing data to SD!\t\n");
    return XST_SUCCESS;
}
