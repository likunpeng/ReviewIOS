//
//  UIMacros.h
//  HuaXiaFinance
//
//  Created by Ye Yang on 2017/7/28.
//  Copyright © 2017年 花虾金融. All rights reserved.
//

#ifndef UIMacros_h
#define UIMacros_h

// Screen
#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define kScale  [[UIScreen mainScreen] scale]

// Size Of Contols
#define kSTATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define kNAVIGATIONBAR_HEIGHT (kSTATUSBAR_HEIGHT + 44.0f)
#define kTABBAR_HEIGHT  self.tabBarController.tabBar.bounds.size.height

// Device by Resolution
#define IS_LOWRES CGSizeEqualToSize(CGSizeMake(320.0f, 480.0f), [[UIScreen mainScreen] bounds].size)
#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 960.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 1136.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750.0f, 1334.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242.0f, 2208.0f), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1125.0f, 2001.0f), [[UIScreen mainScreen] currentMode].size)) : NO)
//#define IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125.0f, 2436.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONEX (CGSizeEqualToSize(CGSizeMake(375.0f, 812.0f), [[UIScreen mainScreen] bounds].size) || CGSizeEqualToSize(CGSizeMake(414.0f, 896.0f), [[UIScreen mainScreen] bounds].size))

// Font
//#define fontAuto(size) [UIFont systemFontOfSize:S(size)]
#define fontAuto(font) [UIFont fontWithName:@"PingFangSC-Ultralight"size:S(font)]
#define fontBoldAuto(size) [UIFont boldSystemFontOfSize:S(size)]
//#define fontAuto(font)  [UIFont fontWithName:@"PingFangSC-Medium"size:S(font)]

// RGB(0.0f, 0.0f, 0.0f)
#define RGBa(r,g,b,a) [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:a]
#define RGB(r,g,b)    RGBa(r, g, b, 1.0f)

// HEXRGB(0xF7F8FA)
#define HEXRGBa(v,a)  RGBa(((float)((v & 0xFF0000) >> 16)), ((float)((v & 0xFF00) >> 8)), ((float)(v & 0xFF)), a)
#define HEXRGB(v)     HEXRGBa(v, 1.0f)

// COLORs
#define COLOR_WHITE         RGB(255.0f, 255.0f, 255.0f) // White
#define COLOR_LIGHTERWHITE  RGB(251.0f, 251.0f, 251.0f) // 浅白
#define COLOR_LIGHTERGRAY   RGB(250.0f, 250.0f, 250.0f) // 浅浅灰
#define COLOR_BLACK         RGB(51.0f, 51.0f, 51.0f)    // 0x333333 深黑(Black)
#define COLOR_LIGHTGRAY     RGB(153.0f, 153.0f, 153.0f) // 0x999999 浅灰(LightGray)
#define COLOR_DARKGRAY      RGB(102.0f, 102.0f, 102.0f) // 0x666666 深灰(DarkGray)
#define COLOR_RED           RGB(255.0f, 76.0f, 59.0f)   // 0xFF4C3B 红(主色调)
#define COLOR_BLUE          RGB(31.0f, 167.0f, 254.0f)  // 0x1FA7FE 蓝(Blue)
#define COLOR_GOLD          RGB(222.0f, 174.0f, 94.0f)  // 0xDEAE5E 金(Gold)
#define COLOR_LIGHTRED      RGB(255.0f, 214.0f, 210.0f)  // 字浅红
#define COLOR_BGREDCOLOR    RGB(255.0f, 240.0f, 240.0f)  //背景浅红
#define COLOR_BREENCOLOR    RGB(112.0f, 189.0f, 116.0f)  //绿色
#define COLOR_LINE_LIGHTRED RGB(255.0f, 199.0f, 194.0f)  // 线浅红

// COLOR for USE
#define COLOR_LINE              RGB(236.0f, 236.0f, 236.0f) // 0xECECEC
#define COLOR_FONT_B            COLOR_BLACK
#define COLOR_FONT_W            COLOR_WHITE
#define COLOR_FONT_R            COLOR_RED
#define COLOR_BG_GRAY           RGB(248.0f, 248.0f, 248.0f) // 0xF8F8F8 灰色背景
#define COLOR_GRADIENT_START    COLOR_RED                   // 0xFF4C3B 渐变色开始颜色
#define COLOR_GRADIENT_END      RGB(255.0f, 127.0f, 115.0f) // 0xFF7F73 渐变色结束颜色
#define COLOR_HEADRED           RGB(255.0f, 18.0f, 0.0f)    // headerview 红
#define COLOR_BORDERRED         RGB(255.0f, 113.0f, 100.0f) // 边框红
#define COLOR_BORDERGRAY        RGB(236.0f, 236.0f, 236.0f) // 边框灰
#define COLOR_SHADOWRED         RGB(255.0f, 152.0f, 142.0f) // 红色阴影

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* UIMacros_h */
