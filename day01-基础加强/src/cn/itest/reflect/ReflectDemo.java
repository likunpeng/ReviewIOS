package cn.itest.reflect;

import cn.itest.domain.Person;

public class ReflectDemo {
    public static void main(String[] args) throws ClassNotFoundException {
        // 1.class.forName("全类名")
        Class classDemo = Class.forName("cn.itest.domain.Person");
        System.out.println(classDemo);

        // 类名。class
        Class cls = Person.class;
        System.out.println(cls);

        // 对象.getClass
        Person p = new Person();
        Class cls2 = p.getClass();
        System.out.println(cls2);

        System.out.println(classDemo == cls);
        System.out.println(cls2 == cls);
    }
}
