//
//  JXObject.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/12.
//

#import <UIKit/UIKit.h>
#import "JXIdentifiable.h"

@interface JXObject : NSObject <JXIdentifiable>
@property (nonatomic, copy, readonly) NSString *mid;

@end

