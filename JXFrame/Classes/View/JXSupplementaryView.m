//
//  JXSupplementaryView.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXSupplementaryView.h"
#import "JXFunc.h"

@implementation JXSupplementaryView

+ (NSString *)identifier {
    return JXStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

+ (CGSize)sizeForSection:(NSInteger)section {
    return CGSizeZero;
}

@end
