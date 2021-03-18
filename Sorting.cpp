#include <stdio.h>
#include <string.h>

//i will be using counting sort, as it is very efficient when sorting numbers
void countSort (int array[], int n){
	//create a duplicate arr for sorting it
	int arr[n];
	int i;
	
	//find the max value of array
	int max = 0;
	for(i = 0; i < n; i++){
		if (array[i] > max){
			max = array[i];
		}
	}
	
	//create a count array, make the value zero then store 1 for each available value 
	int count[max + 1];
	for (i = 0; i <= max + 1; ++i){
		count[i] = 0;
	}
	for (i = 0; i < n; i++){
		count[array[i]]++;
	}
	
	//store cumulative value of each array
	for (i = 1; i <= max + 1; i++){
		count[i] += count[i - 1];
	}
	
	//copy each element from array to arr
	for (i = n - 1; i >= 0; i--){
		arr[count[array[i]] - 1] = array[i];
		count[array[i]]--;
	}
	
	for (i = 0; i < n; i++){
		printf("%d", arr[i]);
		if (i != n - 1){
			printf(" ");
		}
	}
}

int main(){
	int array[] = {10,2,1,5,3,6};
	int n = sizeof(array) / sizeof(array[0]);
	countSort(array, n);
	return 0;
}
