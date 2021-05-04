//
//  main.cpp
//  Test
//
//  Created by 李坤鹏 on 2021/4/27.
//  Copyright © 2021 李坤鹏. All rights reserved.
//
void swap(int k[], int low, int high) {
    int temp;
    temp = k[low];
    k[low] = k[high];
    k[high] = temp;
}
int Partition(int k[], int low, int high) {
    int point;
    point = k[low];
    while (low < high) {
        while (low< high && k[high] >= point) {
            high--;
        }
        swap(k, low, high);
        while (low< high && k[low] <= point) {
            low++;
        }
        swap(k, low, high);
    }
    return point;
}

void QSort(int k[], int low, int high) {
    int point;
    if (low < high) {
        point = Partition(k, low, high); //
        QSort(k, low, point - 1);
        QSort(k, point + 1, high);
    }
}

void QuickSort(int k[], int n) {
    QSort(k, 0, n-1);
}

// =================下面是优化的快速排序=======================
// (1)优化关键值的选取
int PartitionOne(int k[], int low, int high) {
    int point;
    int m = low + (high - low)/2;
    
    if (k[low] > k[high]) {
        swap(k, low, high);
    }
    if (k[m] > k[high]) {
        swap(k, m, high);
    }
    if (k[m] > k[low]) {
        swap(k, m, low);
    }
    
    point = k[low];
    while (low < high) {
        while (low< high && k[high] >= point) {
            high--;
        }
        swap(k, low, high);
        while (low< high && k[low] <= point) {
            low++;
        }
        swap(k, low, high);
    }
    return point;
}

void QSortOne(int k[], int low, int high) {
    int point;
    if (low < high) {
        point = PartitionOne(k, low, high); //
        QSort(k, low, point - 1);
        QSort(k, point + 1, high);
    }
}

void QuickSortOne(int k[], int n) {
    QSortOne(k, 0, n-1);
}


// (2)优化不必要的交换
int PartitionTwo(int k[], int low, int high) {
    int point;
    int m = low + (high - low)/2;
    
    if (k[low] > k[high]) {
        swap(k, low, high);
    }
    if (k[m] > k[high]) {
        swap(k, m, high);
    }
    if (k[m] > k[low]) {
        swap(k, m, low);
    }
    
    point = k[low];
    while (low < high) {
        while (low< high && k[high] >= point) {
            high--;
        }
        k[low] = k[high];
        while (low< high && k[low] <= point) {
            low++;
        }
        k[high] = k[low];
    }
    k[low] = k[point];
    return point;
}

void QSortTwo(int k[], int low, int high) {
    int point;
    if (low < high) {
        point = PartitionTwo(k, low, high); //
        QSort(k, low, point - 1);
        QSort(k, point + 1, high);
    }
}

void QuickSortTwo(int k[], int n) {
    QSortTwo(k, 0, n-1);
}

// (3)优化小数组时的排序方案 就是数组长度小于一个值的时候（7或者 50）直接使用选择排序即可
int PartitionThree(int k[], int low, int high) {
    int point;
    int m = low + (high - low)/2;
    
    if (k[low] > k[high]) {
        swap(k, low, high);
    }
    if (k[m] > k[high]) {
        swap(k, m, high);
    }
    if (k[m] > k[low]) {
        swap(k, m, low);
    }
    
    point = k[low];
    while (low < high) {
        while (low< high && k[high] >= point) {
            high--;
        }
        k[low] = k[high];
        while (low< high && k[low] <= point) {
            low++;
        }
        k[high] = k[low];
    }
    k[low] = k[point];
    return point;
}

void QSortThree(int k[], int low, int high) {
    int point;
    if (low < high) {
        point = PartitionTwo(k, low, high); //
        QSort(k, low, point - 1);
        QSort(k, point + 1, high);
    }
}

void QuickSortThree(int k[], int n) {
    QSortTwo(k, 0, n-1);
}


#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
    int i, a[10] = {5, 2, 6, 0 , 3, 9, 1, 7, 4, 8};
//    QuickSort(a, 10);
//    QuickSortOne(a, 10);
//    QuickSortTwo(a, 10);
    QuickSortThree(a, 10);
    printf("排序后的结果是：");
    for (int i = 0; i < 10; i++) {
        printf("%d", a[i]);
    }
    printf("\n\n");
    return 0;
}
