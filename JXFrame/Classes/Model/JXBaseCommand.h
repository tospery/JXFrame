//
//  JXBaseCommand.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/17.
//

#import <UIKit/UIKit.h>
#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>
#import "JXWebViewModel.h"

@interface JXBaseCommand : NSObject
@property (nonatomic, strong, readonly) JXWebViewModel *viewModel;

- (instancetype)initWithViewModel:(JXWebViewModel *)viewModel;

- (void)handle:(id)data responseCallback:(WVJBResponseCallback)responseCallback;

@end

