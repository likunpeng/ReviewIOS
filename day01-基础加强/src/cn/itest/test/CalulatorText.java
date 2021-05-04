package cn.itest.test;

import cn.itest.junit.Calculator;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class CalulatorText {
    /**
     * 初始化方法
     */
    @Before
    public void init() {
        System.out.println("init");
    }
    /*
    * 释放方法
    * */
    @After
    public void close() {
        System.out.println("after");
    }

    @Test
    public void testAdd() {
        System.out.println("running ");
        Calculator c = new Calculator();
        int result = c.add(1,2);
        System.out.println("result = " + result);
//        Assert.assertEquals(4, result);
    }

    @Test
    public void testSub() {
        Calculator c = new Calculator();
        int result = c.sub(1, 2);
        System.out.println("result = " + result);
    }
}



