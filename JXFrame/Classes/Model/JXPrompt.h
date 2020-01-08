//
//  JXPrompt.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>
#import "JXType.h"

@interface JXPrompt : NSObject

- (void)showToastLoading:(NSString *)title;
- (id)showToastMessage:(NSString *)message;
- (void)hideToast;

- (void)showPopup:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelText:(NSString *)cancelText submitText:(NSString *)submitText handler:(JXVoidBlock_string)handler;

+ (void)showToastLoading:(NSString *)title;
+ (id)showToastMessage:(NSString *)message;
+ (void)hideToast;

+ (void)showPopup:(NSString *)message;

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelText:(NSString *)cancelText submitText:(NSString *)submitText handler:(JXVoidBlock_string)handler;

@end

