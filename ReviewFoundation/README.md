Foundation框架—结构体
一、基本知识
Foundation—基础框架。框架中包含了很多开发中常用的数据类型，如结构体，枚举，类等，是其他ios框架的基础。
如果要想使用foundation框架中的数据类型，那么包含它的主头文件就可以了。
即#import<foundation/foundation.h>
补充：core foundation框架相对底层，里面的代码几乎都是c语言的，而foundation中是OC的。

(1)
NSRange(location, length) 表示范围
NSPoint\CGPoint           表示坐标
NSSie\CGSize             表示UI元素的尺寸
NSRect\CGRect(CGPoint CGSize) 一个UI元素的位置和尺寸

字符串型：

NSString：不可变字符串

NSMutableString:可变字符串

集合型：

1）

NSArray：OC不可变数组

NSMutableArray：可变数组

2）

NSSet：

NSMutableSet：

3）

NSDictiorary

NSMutableDictiorary

其它：

NSDate

NSObject


一）NSArray不可变数组

（1）NSArray的基本介绍

NSArray是OC中使用的数组，是面向对象的，以面向对象的形式操纵对象，是不可变数组。

C语言数组有一个缺点即数组中只能存放同种数据类型的元素。

OC数组只能存放OC对象，不能存放非OC对象，如int，结构体和枚举等。

（2）NSArray的创建
  看代码


三）NSSet和NSArray的对比

（1）共同点：

1）都是集合，都能够存放多个对象

2）只能存放oc对象，不能存放非oc对象类型（如int等基本数据类型和结构体，枚举等）。

3）本身都不可变，都有一个可变的子类。

（2）不同点：

1）NSArray有顺序，NSSet没有顺序



