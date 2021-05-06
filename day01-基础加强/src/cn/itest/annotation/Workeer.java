package cn.itest.annotation;
@MyAnno(value = 12, anl = Animal.a1, anno2 = @MyAnno2, strs = {"ac", "bc"})
@MyAnno3
public class Workeer {

    @MyAnno3
    public String name = "aaa";

    @MyAnno3
    public void show() {

    }
}
