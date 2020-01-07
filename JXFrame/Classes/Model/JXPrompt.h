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
- (void)showToastMessage:(NSString *)message;
- (void)hideToast;

- (void)showPopup:(NSString *)message;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles handler:(JXVoidBlock_string)handler;

+ (void)showToastLoading:(NSString *)title;
+ (void)showToastMessage:(NSString *)message;
+ (void)hideToast;

+ (void)showPopup:(NSString *)message;

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles handler:(JXVoidBlock_string)handler;

@end

