//
//  AccountManager.h
//  HuaXiaLoan
//
//  Created by Ye Yang on 17/4/13.
//  Copyright © 2017年 花虾金融. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 账户管理：token、tel、手势解锁相关、指纹解锁相关
 */
@interface AccountManager : NSObject

+ (void)removeAccount;              // 删除当前账户信息

// token
+ (void)saveToken:(NSString*)token; // 保存Token
+ (NSString*)token;                 // 获取Token (没有时返回NSNull)
+ (NSString*)tokenString;           // 获取Token字符串 (没有时返回空串"")
+ (BOOL)hasToken;                   // 是否已登录

// tel
+ (void)saveTel:(NSString*)tel;     // 保存手机号
+ (NSString*)tel;                   // 获取手机号 (没有时返回空串"")

// 指纹密码
+ (void)saveGesturePwd:(NSString*)gesturePwd;   // 保存手势密码
+ (NSString*)gesturePwd;                        // 获取手势密码

// 生物识别本地开关(TouchID/FaceID)
+ (void)setLocalAuthBiometryAvailable:(BOOL)available;
+ (BOOL)isLocalAuthBiometryAvailable;

// 生物识别建议
+ (void)setAuthBiometryAdvice:(BOOL)enable;
+ (BOOL)authBiometryAdvice;

// 显示金额开关
+ (BOOL)isBalanceVisible;
+ (void)setBalanceVisible:(BOOL)visible;

//// userName
//+ (void)saveUserName:(NSString *)userName;  // 保存用户姓名
//+ (NSString *)userName;                     // 获取用户姓名 (没有时返回空串"")
//
//// idNumber
//+ (void)saveIDNumber:(NSString *)IDNumber;  // 保存用户身份证号
//+ (NSString *)IDNumber;                     // 获取用户身份证号 (没有时返回空串"")
//
//// isVerifyAuth
//+ (void)saveVerifyAuth:(NSNumber *)isVerifyAuth;   // 保存用户实名认证状态
//+ (BOOL)isVerifyAuth;                              // 获取用户实名认证状态 (没有时返回NO)


@end
