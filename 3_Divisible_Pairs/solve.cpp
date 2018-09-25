/**
	Heitor Rodrigues
	https://csacademy.com/contest/interview-archive/task/3-divisible-pairs/
*/
#include <bits/stdc++.h>

using namespace std;

int arr[100001];

const int a;

int main() {
    int n;
    scanf ("%d",&n);

    long long ones = 0, twos = 0, zeros = 0;

    for (int i = 0; i < n; i++){
        scanf ("%d",&arr[i]);
        arr[i] %= 3;
        if (arr[i] == 1) ones++;
        if (arr[i] == 2) twos++;
        if (arr[i] == 0) zeros++;
    }

    long long res = ones*twos;

    res += (zeros*(zeros-1))/2;

    printf ("%lld\n",res);
    return 0;
}
