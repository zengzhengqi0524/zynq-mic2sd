/*
 * bsp_sd.h
 *
 *  Created on: 2021年1月4日
 *      Author: IRON
 */

#ifndef SRC_BSP_SD_H_
#define SRC_BSP_SD_H_

#include "xil_printf.h"
#include <stdio.h>
#include "stdlib.h"
#include "xscugic.h"
#include "ff.h"
#include "xtime_l.h"
#include "xparameters.h"
#include "sleep.h"

//---------------------------------------------------------
// 参数定义
//---------------------------------------------------------
#define READ_ADDR_0				0x10000000
#define BYTE_NUM       			0x00010000  //BRAM bytes number

//---------------------------------------------------------
// 函数声明
//---------------------------------------------------------

int SD_Init();
void Write2SD();
int SD_Transfer_read();
int SD_Transfer_write();

#endif /* SRC_BSP_SD_H_ */
