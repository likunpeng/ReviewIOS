//
//  CustomView.m
//  ReviewCGContextRef
//
//  Created by lkp on 2017/8/30.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef cgContextRef = UIGraphicsGetCurrentContext();
    
    //write text
    CGContextSetRGBFillColor(cgContextRef, 1, 0, 1, 1.0f);
    
    UIFont *font = [UIFont boldSystemFontOfSize:15.0f];
    UIColor *color = [UIColor whiteColor];
    
    [@"draw cicle" drawInRect:CGRectMake(10, 20, 200, 20) withFont:font];
    
//    NSDictionary<NSString> *dicStr = [NSDictionary alloc] initwi
    [@"draw cicle" drawInRect:(CGRectMake(10, 50, 100, 20)) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}];
    
    
    
    
}

@end
