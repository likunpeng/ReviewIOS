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
