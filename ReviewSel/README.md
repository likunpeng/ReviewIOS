一、description方法

Description方法包括类方法和对象方法。（NSObject类所包含）

（一）基本知识

-description（对象方法）

使用NSLog和@%输出某个对象时，会调用对象的description方法，并拿到返回值进行输出。

+description（类方法）

使用NSLog和@%输出某个对象时，会调用类对象的description方法，并拿到返回值进行输出，把整个对象一次性打印出来，打印对象使用%@。

使用@%打印对象如（“@%”,P）默认打印输出为<类名：内存地址>，虽然字符串也是对象，但字符串在使用@%打印时情况特殊
那么应该怎么实现打印对象的所有属性呢？在类的实现中重写description方法。

三）区别

+description方法决定了类对象的输出结果，即类本身

-description方法决定了实例对象的输出结果，即Person创建的对象。



SEL:全称Selector 表示方法的存储位置
Person *p=[[Person alloc] init];

[p test];

寻找方法的过程：

（1）首先把test这个方法名包装成sel类型的数据；

（2）根据SEL数据找到对应的方法地址；

（3）根据方法地址调用相应的方法。

（4）注意:在这个操作过程中有缓存，第一次找的时候是一个一个的找，非常耗性能，之后再用到的时候就直接使用。

关于_cmd:每个方法的内部都有一个-cmd,代表着当前方法。



注意：SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去寻找对应的方法地址，找到方法地址后就可以调用方法。这些都是运行时特性，发消息就是发送SEL，然后根据SEL找到地址，调用方法。
