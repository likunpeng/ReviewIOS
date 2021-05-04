package cn.itest.reflect;

import cn.itest.domain.Person;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ReflectDemo2 {
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        // 获取person的class对象
        Class personClass = Person.class;
        // 获取构造方法
        Constructor constructor = personClass.getConstructor();
        System.out.println(constructor);

        Constructor constructor2 = personClass.getConstructor(String.class, int.class);
        System.out.println(constructor2);
//        Method method = personClass.getMethod();
        Object person = constructor2.newInstance("lisi", 23);
        System.out.println(person);

        Object person1 = constructor.newInstance();
        System.out.println(person1);

        Object o = personClass.newInstance();
        System.out.println(o);
    }

}
