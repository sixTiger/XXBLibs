//
//  MBProgressHUD+XXB.h
//
//  Created by XXB on 13-4-18.
//  Copyright (c) 2013年 xiaoxiaobing. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (XXB)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (MBProgressHUD *)showHoldMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showHoldMessage:(NSString *)message withNoMasktoView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
