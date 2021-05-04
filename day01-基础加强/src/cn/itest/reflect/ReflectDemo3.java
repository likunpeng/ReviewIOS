package cn.itest.reflect;

import cn.itest.domain.Person;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectDemo3 {
    public static void main(String[] args) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        // 获取person的class对象
        Class personClass = Person.class;
        // 获取方法
        Method method = personClass.getMethod("eat");
        System.out.println(method);
        Person p = new Person();
        method.invoke(p);

        Method[] methods = personClass.getMethods();
        for (Method method1: methods) {
            System.out.println(method1);
        }

        for (Method method1: methods) {
            System.out.println(method1.getName());
        }
        // 获取类名

        String className = personClass.getName();
        System.out.println(className);
    }

}
