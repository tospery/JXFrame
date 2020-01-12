//
//  JXCollectionItem.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXBaseItem.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface JXCollectionItem : JXBaseItem
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, strong) RACCommand *didSelectCommand;

@end

