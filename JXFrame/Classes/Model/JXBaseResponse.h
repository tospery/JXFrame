//
//  JXBaseResponse.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/24.
//

#import <OvercoatObjC/OvercoatObjC.h>

@interface JXBaseResponse : OVCResponse
@property (nonatomic, strong, readonly) NSString *message;
@property (nonatomic, assign) NSInteger code;

@end

