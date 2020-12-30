#include "stdafx.h"
#include<iostream>
using namespace std;

void print(int arr[], int n)
{
	for (int j = 0; j<n; j++)
	{
		cout << arr[j] << "  ";
	}
	cout << endl;
}

void BubbleSort(int arr[], int n)
{
	for (int i = 0; i < n - 1; i++)
	{
		for (int j = 0; j < n - i - 1; j++)
		{
			if (arr[j] > arr[j + 1])
			{
				int temp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = temp;
			}
		}
	}
}

int main()
{
	int s[12] = { 8,1,9,7,2,4,5,6,10,3 ,5 ,5};
	cout << "初始序列：";
	print(s, 10);
	BubbleSort(s, 10);
	cout << "排序结果：";
	print(s, 10);
	system("pause");
}