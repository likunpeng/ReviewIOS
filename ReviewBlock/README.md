一）简介

BLOCK是什么？苹果推荐的类型，效率高，在运行中保存代码。用来封装和保存代码，有点像函数，BLOCK可以在任何时候执行。

BOLCK和函数的相似性：（1）可以保存代码（2）有返回值（3）有形参（4）调用方式一样。

标识符 ^

(1）定义BLOCK变量

Int (^SumBlock)(int,int);//有参数，返回值类型为int

Void (^MyBlock)()；//无参数，返回值类型为空

（2）利用block封装代码


(3）Block访问外部变量

1）Block内部可以访问外部变量；

2）默认情况下，Block内部不能修改外部的局部变量

3）给局部变量加上__block关键字，则这个局部变量可以在block内部进行修改。


（4）利用typedef定义block类型(和指向函数的指针很像)

Typedef int(^MyBlock)(int ,int);

以后就可以利用这种类型来定义block变量了。

MyBlock a,b;  

a=^(int a,int b){return a-b;};

MyBlock b2=^(int n1,int n2){return n1*n2;};


