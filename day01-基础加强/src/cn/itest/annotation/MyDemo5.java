package cn.itest.annotation;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;

/**
 * 框架类 可以创建任意类 可以执行任意方法 不能改变该类的任何代码
 * 实现方法
 */
@Pro(className = "cn.itest.annotation.Demo2", methodName = "show2")
public class MyDemo5 {
    public static void main(String[] args) throws IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Properties pero = new Properties();
        // 1解析注解
//        1.1获取该类的字节码文件
        Class<MyDemo5> myDemo5Class = MyDemo5.class;
        //1.2 获取上边的注解对象
        Pro an = myDemo5Class.getAnnotation(Pro.class); // 其实在内存中生成了该注解接口的子类实现的对象
        //1.3 调用注解对象中的方法
        String className =  an.className();
        System.out.println(className);
        String classMethod = an.methodName();
        System.out.println(classMethod);

        //加载该类进内存
        Class cls = Class.forName(className);

        // 创建对象
        Object obj = cls.newInstance();
        // 获取方法对象
        Method method = cls.getMethod(classMethod);
        // 执行
        method.invoke(obj);
    }

}
