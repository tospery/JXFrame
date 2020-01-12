//
//  JXCollectionCell.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/7.
//

#import <UIKit/UIKit.h>
#import <QMUIKit/QMUIKit.h>
#import "JXReactiveView.h"
#import "JXCollectionItem.h"

@interface JXCollectionCell : UICollectionViewCell <JXReactiveView>
@property (nonatomic, strong, readonly) JXCollectionItem *viewModel;

+ (NSString *)identifier;

@end

