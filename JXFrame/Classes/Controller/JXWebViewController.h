//
//  JXWebViewController.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/8.
//

#import "JXScrollViewController.h"
#import <WebKit/WebKit.h>

@interface JXWebViewController : JXScrollViewController <WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong, readonly) WKWebView *webView;

@end

