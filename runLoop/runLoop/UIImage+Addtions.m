//
//  UIImage+Addtions.m
//  runLoop
//
//  Created by lkp on 2019/1/16.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "UIImage+Addtions.h"

@implementation UIImage (Addtions)

//返回一张圆形图片
- (instancetype)imageWithCircle
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [path addClip];
    [self drawAtPoint:CGPointZero];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
