package cn.itest.annotation;

/**
 * --  @Override: 是否是继承父类
 * --  @Deprecated：过时
 * --  @SuppressWarnings：压制警告
 */

public class AnnoDemo2 {

    @Override
    public String toString() {
        return super.toString();
    }

    @Deprecated
    public void show1() {
        System.out.println("show1");
    }

    @SuppressWarnings("all")
    public void show2() {
        System.out.println("show2");
    }

    public void demo1() {
        show1();
    }
}

