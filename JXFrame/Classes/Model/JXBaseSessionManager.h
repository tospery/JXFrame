//
//  JXBaseSessionManager.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/24.
//

#import <OvercoatObjC/OvercoatObjC.h>

@interface JXBaseSessionManager : OVCHTTPSessionManager

- (RACSignal *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters;

@end

