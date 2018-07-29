/**
	Heitor Rodrigues
	https://csacademy.com/ieeextreme-practice/task/09f92a575cc006d4a6a7f525f370ec30/
*/

#include <iostream>

using namespace std;

int main() {
	int t;
	scanf ("%d",&t);

	int arr[61];
	int prev = 0, cur = 1;

	for (int j = 0; j <= 60; j++) {
		int tmp = cur;
		cur = (cur%10 + prev%10)%10;
		prev = tmp;
		arr[j] = cur;
	}

	for (int i = 0; i < t; i++) {
		int m;
		scanf ("%d",&m);
		m--;
		m %= 60;
		printf("%d\n",arr[m]);
	}
	return 0;
}
