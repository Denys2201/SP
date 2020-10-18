#include "pch.h"
#include <iostream>

#include <stdio.h>

extern "C" int calc(int, int, int);

int main(){
	int res = 0;
	int b = 0;
	int d = 0;
	int e = 0;
	printf("B = ");
	scanf_s("%d", &b);
	printf("D = ");
	scanf_s("%d", &d);
	printf("E = ");
	scanf_s("%d", &e);

	res = calc(b, d, e);
	printf("Result: %d", res);
	return 0;
}
