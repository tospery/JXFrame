//
//  JXCollectionCell.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>
#import <QMUIKit/QMUIKit.h>
#import "JXCollectionItem.h"

@interface JXCollectionCell : UICollectionViewCell
@property (nonatomic, strong) JXCollectionItem *item;
@property (nonatomic, strong, readonly) QMUILabel *titleLabel;

- (void)didInitialize;

+ (NSString *)identifier;

@end

