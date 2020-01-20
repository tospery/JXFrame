//
//  JXPage.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/21.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JXPageStyle){
    JXPageStyleGroup,
    JXPageStyleOffset
};

@interface JXPage : NSObject
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) JXPageStyle style;

@end

