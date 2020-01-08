//
//  JXPrompt.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXPrompt.h"
#import <QMUIKit/QMUIKit.h>
#import "JXFunction.h"
#import "JXBaseView.h"

@interface JXPrompt ()
@property (nonatomic, copy) JXVoidBlock_int alertHandler;
@property (nonatomic, copy) JXVoidBlock_id errorHandler;

@end

@implementation JXPrompt

#pragma mark - Method
- (void)showToastLoading:(NSString *)title {
    [QMUITips showLoading:title inView:UIApplication.sharedApplication.delegate.window];
}

- (id)showToastMessage:(NSString *)message {
    [QMUITips hideAllTips];
    return [QMUITips showWithText:message];
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

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelText:(NSString *)cancelText submitText:(NSString *)submitText handler:(JXVoidBlock_string)handler {
    QMUIDialogViewController *alert = [[QMUIDialogViewController alloc] init];
    alert.title = title;
    if (title.length == 0) {
        alert.headerViewHeight = 0;
    }
    JXBaseView *contentView = [[JXBaseView alloc] qmui_initWithSize:CGSizeMake(JXMetric(240), JXMetric(60))];
    contentView.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
    QMUILabel *label = [[QMUILabel alloc] qmui_initWithFont:JXFont(15) textColor:UIColorBlack];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = message;
    [label sizeToFit];
    [contentView addSubview:label];
    label.frame = contentView.bounds;
    alert.contentView = contentView;
    if (cancelText.length != 0) {
            [alert addCancelButtonWithText:cancelText block:^(QMUIDialogViewController *alert) {
            if (handler) {
                handler(cancelText);
            }
        }];
    }
    if (submitText.length != 0) {
        [alert addSubmitButtonWithText:submitText block:^(QMUIDialogViewController *alert) {
            [alert hide];
            if (handler) {
                handler(submitText);
            }
        }];
    }
    [alert show];
}

#pragma mark - Class
+ (void)showToastLoading:(NSString *)title {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showToastLoading:title];
}

+ (id)showToastMessage:(NSString *)message {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    return [prompt showToastMessage:message];
}

+ (void)hideToast {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt hideToast];
}

+ (void)showPopup:(NSString *)message {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showPopup:message];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelText:(NSString *)cancelText submitText:(NSString *)submitText handler:(JXVoidBlock_string)handler {
    JXPrompt *prompt = [[JXPrompt alloc] init];
    [prompt showAlertWithTitle:title message:message cancelText:cancelText submitText:submitText handler:handler];
}

@end
