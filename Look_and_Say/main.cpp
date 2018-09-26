#include <iostream>
#include <string.h>
using namespace std;

string lookandsay(int N){
    string number = "1";
    string new_number = "";
    char aux;
    int count = 0;

    for (int i = 1; i < N; i++){
        aux = number[0];
        for (int j = 0; j < number.size(); j++){
            if (aux == number[j]){
                count++;
            }
            else{
                new_number+= to_string(count) + aux;
                count = 0;
                aux = number[j];
                count++;
            }
        }
        new_number+= to_string(count) + aux;
        count = 0;
        number = new_number;
        new_number = "";
    }

    return number;
}

int main() {

    int n;
    scanf("%d", &n);
    printf("%s\n", lookandsay(n).c_str());
}
