//
//  JXBaseSessionManager.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/24.
//

#import "JXBaseSessionManager.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "JXType.h"
#import "JXBaseResponse.h"
#import "NSError+JXFrame.h"

typedef RACSignal *(^MapBlock)(JXBaseResponse *);

@interface JXBaseSessionManager ()
@property(nonatomic, copy) MapBlock mapBlock;

@end

@implementation JXBaseSessionManager
- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration {
    if (self = [super initWithBaseURL:url sessionConfiguration:configuration]) {
        NSMutableSet *contentTypes = [self.responseSerializer.acceptableContentTypes mutableCopy];
        [contentTypes addObjectsFromArray:@[
            @"text/html",
            @"application/javascript"
        ]];
        self.responseSerializer.acceptableContentTypes = contentTypes;
        self.mapBlock = ^RACSignal *(JXBaseResponse *response) {
            if (response.code != JXErrorCodeSuccess) {
                return [RACSignal error:[NSError jx_errorWithCode:response.code description:response.message]];
            }
            return [RACSignal return:response.result];
        };
    }
    return self;
}

- (RACSignal *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters {
    return [[self rac_GET:URLString parameters:parameters] flattenMap:self.mapBlock];
}


@end
