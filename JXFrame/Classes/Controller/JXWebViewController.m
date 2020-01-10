//
//  JXWebViewController.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/8.
//

#import "JXWebViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>
#import "JXFunction.h"
#import "JXWebViewModel.h"
#import "JXWebProgressView.h"

#define kJXWebEstimatedProgress         (@"estimatedProgress")

@interface JXWebViewController ()
@property (nonatomic, strong, readwrite) JXWebViewModel *viewModel;
@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong) JXWebProgressView *progressView;

@end

@implementation JXWebViewController
@dynamic viewModel;

#pragma mark - Init
- (void)dealloc {
    _webView.navigationDelegate = nil;
    _webView.UIDelegate = nil;
    _webView = nil;
}

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];
    self.webView.frame = CGRectMake(0, self.contentTop, self.view.qmui_width, self.view.qmui_height - self.contentTop - self.contentBottom);
    
    [self.view addSubview:self.progressView];
    self.progressView.frame = CGRectMake(0, self.contentTop, self.view.qmui_width, 1.5f);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.viewModel.url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [self.webView loadRequest:request];
}

#pragma mark - Property
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        WKWebView *view = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
        view.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
        view.navigationDelegate = self;
        view.UIDelegate = self;
        _webView = view;
    }
    return _webView;
}

- (JXWebProgressView *)progressView {
    if (!_progressView) {
        JXWebProgressView *view = [[JXWebProgressView alloc] initWithFrame:CGRectZero];
        view.progressBarView.backgroundColor = JXObjWithDft(self.viewModel.progressColor, UIColorYellow);
        view.progress = 0.0f;
        _progressView = view;
    }
    return _progressView;
}

#pragma mark - Method
- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self)
    [self.webView rac_observeKeyPath:kJXWebEstimatedProgress options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        @strongify(self)
        if ([value isKindOfClass:NSNumber.class]) {
            [self updateProgress:[(NSNumber *)value floatValue]];
        }
    }];
}

- (void)reloadData {
    [super reloadData];
}

- (void)updateProgress:(CGFloat)progress {
    [self.progressView setProgress:progress animated:YES];
    if (self.viewModel.title.length == 0) {
        @weakify(self)
        [self.webView evaluateJavaScript:@"document.title" completionHandler:^(NSString *title, NSError *error) {
            @strongify(self)
            self.viewModel.title = title;
        }];
    }
}

#pragma mark - Delegate
#pragma mark WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.progressView setProgress:0 animated:NO];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    // [self didFinish:nil];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    // [self didFinish:error];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    // [self didFinish:error];
}

#pragma mark WKUIDelegate
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
//    [JXPrompt showAlertWithTitle:nil message:message cancelText:@"确定" submitText:nil handler:^(NSString *text) {
//        completionHandler();
//    }];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler {
    // YJX_TODO
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:kStringCancel otherButtonTitles:kStringOK, nil];
//    [alertView.rac_buttonClickedSignal subscribeNext:^(NSNumber *index) {
//        completionHandler(index.integerValue == 1);
//    }];
//    [alertView show];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString *result))completionHandler {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:prompt delegate:nil cancelButtonTitle:kStringCancel otherButtonTitles:kStringOK, nil];
//    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
//    UITextField *textField = [alertView textFieldAtIndex:0];
//    textField.placeholder = defaultText;
//    [alertView.rac_buttonClickedSignal subscribeNext:^(NSNumber *index) {
//        completionHandler(index.integerValue == 1 ? textField.text : nil);
//    }];
//    [alertView show];
}

#pragma mark - Class

@end
