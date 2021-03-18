#include <stdio.h>
#include <string.h>

bool checkPalindrome(int x){
	int n = sizeof(x) - 1;
	int array[n];
	for (int i = 0; i < n; i++){
		array[i] = x % 10;
		x /= 10;
	}
	
	int front = 0;
	int rear = n - 1;
	while (rear > front){
		if (array[front] != array[rear]){
			return false;
			break;
		}
		--rear;
		++front;
	}
	return true;
}

int main(){
    int size = 4;
    int number;
    int countPalindrome = 0;
    for (int i = 0; i < size; i++){
        scanf("%d", &number);
        if(checkPalindrome(number)){
        	countPalindrome++;
		}
    }
    printf("%d", countPalindrome);
    return 0;
}
