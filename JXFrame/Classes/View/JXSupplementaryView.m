//
//  JXSupplementaryView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXSupplementaryView.h"
#import <QMUIKit/QMUIKit.h>
#import "JXFunction.h"

@implementation JXSupplementaryView
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
    
}

+ (NSString *)identifier {
    return JXStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

+ (CGSize)sizeForSection:(NSInteger)section {
    return CGSizeZero;
}

@end
