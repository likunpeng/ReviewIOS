package cn.itest.reflect;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;

/**
 * 框架类 可以创建任意类 可以执行任意方法 不能改变该类的任何代码
 * 实现方法
 * 1.配置文件
 * 2.反射
 * 步骤：
 * 1.将需要创建的对象的全类名和需要执行的方法定义在配置文件中
 * 2、
 */
public class ReflectDemo4 {
    public static void main(String[] args) throws IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Properties pero = new Properties();
        // 获取class目录下的配置文件
        ClassLoader classLoader = ReflectDemo4.class.getClassLoader();
        InputStream is = classLoader.getResourceAsStream("pro.properties");
        pero.load(is);

        // 获取
        String className = pero.getProperty("className");
        String methodName = pero.getProperty("methodName");

        //加载该类进内存
        Class cls = Class.forName(className);

        // 创建对象
        Object obj = cls.newInstance();
        // 获取方法对象
        Method method = cls.getMethod(methodName);
        // 执行
        method.invoke(obj);
    }

}
