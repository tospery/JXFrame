//
//  JXPrompt.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXPrompt.h"
#import <QMUIKit/QMUIKit.h>

@interface JXPrompt ()
@property (nonatomic, copy) JXVoidBlock_int alertHandler;
@property (nonatomic, copy) JXVoidBlock_id errorHandler;

@end

@implementation JXPrompt

#pragma mark - Method
- (void)showToastLoading:(NSString *)title {
    [QMUITips showLoading:title inView:UIApplication.sharedApplication.delegate.window];
}

- (void)showToastMessage:(NSString *)message {
    [QMUITips hideAllTips];
    [QMUITips showWithText:message];
}

- (void)hideToast {
    [QMUITips hideAllTips];
}

- (void)showPopup:(NSString *)message {
//    if (0 == message.length) {
//        return;
//    }
//    // TBHUDInfo(message, YES);
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                   handler:(JXVoidBlock_string)handler {
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    if (cancelButtonTitle.length != 0) {
//        [alert addAction:[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//            if (handler) {
//                handler(action.title);
//            }
//        }]];
//    }
//    if (destructiveButtonTitle.length != 0) {
//        [alert addAction:[UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//            if (handler) {
//                handler(action.title);
//            }
//        }]];
//    }
//    for (NSString *other in otherButtonTitles) {
//        [alert addAction:[UIAlertAction actionWithTitle:other style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            if (handler) {
//                handler(action.title);
//            }
//        }]];
//    }
//
//    [[TBForwardManager sharedInstance].topNavigationController presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Class
+ (void)showToastLoading:(NSString *)title {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showToastLoading:title];
}

+ (void)showToastMessage:(NSString *)message {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showToastMessage:message];
}

+ (void)hideToast {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt hideToast];
}

+ (void)showPopup:(NSString *)message {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showPopup:message];
}

+ (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         cancelButtonTitle:(NSString *)cancelButtonTitle
    destructiveButtonTitle:(NSString *)destructiveButtonTitle
         otherButtonTitles:(NSArray *)otherButtonTitles
                   handler:(JXVoidBlock_string)handler {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showAlertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles handler:handler];
}

@end
