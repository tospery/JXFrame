//
//  MTLJSONAdapter+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/21.
//

#import "MTLJSONAdapter+JXFrame.h"
#import "NSValueTransformer+JXFrame.h"

@implementation MTLJSONAdapter (JXFrame)
+ (NSValueTransformer *)UIColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:JXColorValueTransformerName];
}

@end
