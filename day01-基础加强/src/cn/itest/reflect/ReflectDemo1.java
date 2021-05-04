package cn.itest.reflect;

import cn.itest.domain.Person;

import java.lang.reflect.Field;

public class ReflectDemo1 {
    public static void main(String[] args) throws NoSuchFieldException, IllegalAccessException {
        // 获取person的class对象
        Class personClass = Person.class;

        // 获取成员变量
//        getFields() 获取所有public的成员变量
        Field[] fields = personClass.getFields();
        for (Field field: fields) {
            System.out.println(field);
        }

        Field a = personClass.getField("a");
        Person p = new Person();
        System.out.println(a.get(p));
        a.set(p,"Changsha");
        System.out.println(p);
        System.out.println("++++++++++++++++++++++++++++++");
        //        getDeclaredFields() 获取所有的成员变量
        Field[] declaredFields = personClass.getDeclaredFields();
        for (Field field: declaredFields) {
            System.out.println(field);
        }

        Field d = personClass.getDeclaredField("d");
        d.setAccessible(true);
        Object value = d.get(p);
        System.out.println(value);
        d.set(p, "Shh");
        System.out.println(p);
        // 获取成员方法
//        Method method = personClass.getMethod();
    }

}
