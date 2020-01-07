//
//  JXCollectionItem.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import "JXBaseItem.h"

@interface JXCollectionItem : JXBaseItem
@property (nonatomic, assign) CGSize cellSize;
@property (nonatomic, strong) NSAttributedString *title;

@end

