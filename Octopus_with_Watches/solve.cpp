/**
	Heitor Rodrigues
	https://csacademy.com/ieeextreme-practice/task/59d4aae501fe4ced9ffbf3737acd18a2/
*/
#include <bits/stdc++.h>

using namespace std;

int matrix[11][11];
int n, m;
int h_max = 0;
int dl[] = {1,0,2,0,1,1,2,2};
int dc[] = {0,1,0,2,1,2,1,2};

int choose (int row, int row_val, int col_val) {
	return row ? row_val : col_val;
}

int count() {
	int res = 0;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			if (matrix[i][j] == 0) res++;
		}
	}
	return res;
}

void printMatrix() {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			printf ("%d ",matrix[i][j]);
		}
		printf ("\n");
	}
}

int add(int i, int p, int row, int target) {
	int res = 0;

	for (int j = 0; j < choose(row,m,n); j++) {
		int r = choose(row,i,j), c = choose(row,j,i);
		matrix[r][c] = (matrix[r][c] + p)%3;
		if (matrix[r][c] == target) res++;
	}

	return res;
}

void add(int i, int p, int row) {
	add(i,p,row,0);
}

int count_number(int i, int target, int row) {
	int res = 0;

	for (int j = 0; j < choose(row,m,n); j++) {
		int r = choose(row,i,j), c = choose(row,j,i);
		if (matrix[r][c] == target) res++;
	}

	return res;
}

int count_line_col(int r, int c, int target) {
	return count_number(r,target,1) + count_number(c,target,0) - (matrix[r][c] == 0 ? 1 : 0);
}



void solve(int mask) {
	if (mask == (1<<(min(m,n)))-1) return;

	for (int i = 0; i < min(m,n); i++) {
		if (i == min(m,n)-1) h_max = max(h_max,count());

		if ((mask&(1<<i))) continue;

		int tmp = count_line_col(i,i,0);

		for (int k = 0; k < 8; k++) {
			add(i,dl[k],1,0);
			add(i,dc[k],0,0);
			int ct = count_line_col(i,i,0);
			if (ct > tmp) {
				solve(mask|(1<<i));
			}
			add(i,3-dl[k],1);
			add(i,3-dc[k],0);
		}
	}
}

int main() {
	scanf ("%d %d",&n,&m);

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			scanf ("%d",&matrix[i][j]);
			matrix[i][j] = (matrix[i][j]%3);
		}
	}

	for (int i = 0; i < m; i++) {
		add(i,3-matrix[0][i],0);
	}

	for (int i = 0; i < n; i++) {
		add(i,3-matrix[i][0],1);
	}

	h_max = count();

	solve(0);

	printf ("%d\n", h_max);

	return 0;
}
