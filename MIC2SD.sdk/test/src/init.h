#ifndef SRC_INIT_H_
#define SRC_INIT_H_

#include "xil_printf.h"
#include "xscugic.h"
#include "xil_exception.h"

//---------------------------------------------------------
// ��������
//---------------------------------------------------------
#define READ_INT_ID 61
#define INTC_DEVICE_ID XPAR_PS7_SCUGIC_0_DEVICE_ID //�ж��豸
#define INT_TYPE_RISING_EDGE 0x03 //����������
#define INT_TYPE_HIGHLEVEL 0x01 //�ߵ�ƽ����
#define INT_TYPE_MASK 0x03
#define INT_CFG0_OFFSET 0x00000C00

//---------------------------------------------------------
// ��������
//---------------------------------------------------------
void IntcTypeSetup(XScuGic *InstancePtr, int intId, int intType);
int IntcInitFunction(u16 DeviceId);
#endif
