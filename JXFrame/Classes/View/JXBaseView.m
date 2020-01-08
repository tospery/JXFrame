//
//  JXBaseView.m
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/30.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import "JXBaseView.h"
#import <QMUIKit/QMUIKit.h>
#import "JXFunction.h"

@interface JXBaseView ()
@property (nonatomic, strong, readwrite) id viewModel;

@end

@implementation JXBaseView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self didInitialize];
    }
    return self;
}

- (void)didInitialize {
    self.backgroundColor = JXObjWithDft(UIColorForBackground, UIColorWhite);
}

- (void)bindViewModel:(id)viewModel {
    self.viewModel = viewModel;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
