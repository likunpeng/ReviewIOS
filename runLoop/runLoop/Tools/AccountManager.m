//
//  AccountManager.m
//  HuaXiaLoan
//
//  Created by Ye Yang on 17/4/13.
//  Copyright © 2017年 花虾金融. All rights reserved.
//

#import "AccountManager.h"
#import "AppDelegate.h"

@implementation AccountManager

static NSString *const KEY_TOKEN = @"tokenId";
static NSString *const KEY_TEL = @"acountTel";
static NSString *const KEY_GESTURE_PWD = @"gesturePwd";
static NSString *const KEY_BIO_AUTH = @"touchIDOn";
static NSString *const KEY_BIO_AUTH_ADVICE = @"auth-key-bio-advice";
static NSString *const KEY_IDNUMBER = @"account-key-idnumber";
static NSString *const KEY_USERNAME = @"account-key-user-name";
static NSString *const KEY_VERIFYAUTH = @"account-key-verify-auth";
static NSString *const KEY_BALANCE_INVISIBLE = @"account-key-balance-invisible";

+ (void)removeAccount {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_TOKEN];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_TEL];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_GESTURE_PWD];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_BIO_AUTH];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_IDNUMBER];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_USERNAME];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_VERIFYAUTH];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KEY_BALANCE_INVISIBLE];
}

/**
 *  Token
 */
+ (void)saveToken:(NSString*)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:KEY_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*)token {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_TOKEN] ? : [NSNull null];
}

+ (NSString*)tokenString {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_TOKEN] ? : @"";
}

+ (BOOL)hasToken {
    NSString *token = [AccountManager tokenString];
    if (!token || !token.length) {
        return NO;
    } else {
        return YES;
    }
}

/**
 *  Tel
 *  电话号码
 */
+ (void)saveTel:(NSString*)tel {
    [[NSUserDefaults standardUserDefaults] setObject:tel forKey:KEY_TEL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*)tel {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_TEL] ? : @"";
}

/**
 *  手势密码
 */
+ (void)saveGesturePwd:(NSString*)gesturePwd {
    [[NSUserDefaults standardUserDefaults] setObject:gesturePwd forKey:KEY_GESTURE_PWD];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString*)gesturePwd {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_GESTURE_PWD] ? : @"";
}

/**
 *  生物识别本地开关(TouchID/FaceID)
 */
+ (void)setLocalAuthBiometryAvailable:(BOOL)available {
    [[NSUserDefaults standardUserDefaults] setObject:@(available) forKey:KEY_BIO_AUTH];
}

+ (BOOL)isLocalAuthBiometryAvailable {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:KEY_BIO_AUTH] boolValue];
}

// 生物识别建议
+ (void)setAuthBiometryAdvice:(BOOL)enable {
    [[NSUserDefaults standardUserDefaults] setObject:@(enable) forKey:KEY_BIO_AUTH_ADVICE];
}

+ (BOOL)authBiometryAdvice {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:KEY_BIO_AUTH_ADVICE] boolValue];
}

// 显示金额开关
+ (BOOL)isBalanceVisible {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:KEY_BALANCE_INVISIBLE];
}

+ (void)setBalanceVisible:(BOOL)visible {
    [[NSUserDefaults standardUserDefaults] setBool:!visible forKey:KEY_BALANCE_INVISIBLE];
}

/**
 *  UserName
 *  用户姓名
 */
+ (void)saveUserName:(NSString *)userName {
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:KEY_USERNAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString *)userName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_USERNAME] ? : @"";
}

/**
 *  IDNumber
 *  身份证号
 */
+ (void)saveIDNumber:(NSString *)IDNumber {
    [[NSUserDefaults standardUserDefaults] setObject:IDNumber forKey:KEY_IDNUMBER];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (NSString *)IDNumber {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_IDNUMBER] ? : @"";
}

/**
 *  isVerifyAuth
 *  是否实名认证
 */
+ (void)saveVerifyAuth:(NSNumber *)isVerifyAuth {
    [[NSUserDefaults standardUserDefaults] setBool:[isVerifyAuth boolValue] forKey:KEY_VERIFYAUTH];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)isVerifyAuth {
    return [[NSUserDefaults standardUserDefaults] objectForKey:KEY_VERIFYAUTH] ? : NO;
}

@end
