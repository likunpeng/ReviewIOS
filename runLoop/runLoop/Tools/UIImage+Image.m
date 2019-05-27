//
//  UIImage+Image.m
//  贷贷
//
//  Created by x5 on 14-7-10.
//  Copyright (c) 2014年 Creditease. All rights reserved.
//

#import "UIImage+Image.h"
@implementation UIImage (Image)

//+ (UIImage *)fullScreenImageWithImageName:(NSString *)name
//{
//    if (IS_IPHONE4) {
//        name = [name filenameAppend:@"_480h"];
//    }else if (IS_IPHONE5) {
//        name = [name filenameAppend:@"_568h"];
//    }else if (IS_IPHONE6){
//        name = [name filenameAppend:@"_667h"];
//    }else if (IS_IPHONE6P){
//        name = [name filenameAppend:@"_736h"];
//    }
//    else
//    {
//        name = [name filenameAppend:@"_480h"];
//    }
//    return [UIImage imageNamed:name];
//}

+ (UIImage *)stretchImageWithImageName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, (CGRect){.size = size});
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

//+ (UIImage *)imageWithCustomName:(NSString *)name {
//    if (IS_IPHONE6){
//        name = [NSString stringWithFormat:@"%@_667h", name];
//    }
//    return [UIImage imageNamed:name];
//}

@end
