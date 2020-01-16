//
//  JXNavigationController.m
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXNavigationController.h"

@interface JXNavigationController ()

@end

@implementation JXNavigationController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

@end
