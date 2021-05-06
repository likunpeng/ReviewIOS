package cn.itest.annotation;

import java.lang.annotation.*;

/**
 * * @Target: 描述注解能够作用的位置
 * * @Retation:描述注解别保留的阶段
 * * @Documented: 描述注解是否被抽取到api文档中
 * * @Inherited: 描述注解是否被子类继承
 */
@Target(value = {ElementType.TYPE, ElementType.METHOD, ElementType.FIELD}) // 表示MyAnno3只能作用于类上
@Retention(value = RetentionPolicy.RUNTIME)
@Documented()
@Inherited()
public @interface MyAnno3 {
//    public
}
