//
//  JXPageMenuIndicatorCell.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/10.
//

#import "JXPageMenuIndicatorCell.h"
#import "JXPageMenuIndicatorItem.h"

@interface JXPageMenuIndicatorCell ()
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation JXPageMenuIndicatorCell

- (void)didInitialize
{
    [super didInitialize];

    self.separatorLine = [[UIView alloc] init];
    self.separatorLine.hidden = YES;
    [self.contentView addSubview:self.separatorLine];
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    JXPageMenuIndicatorItem *model = (JXPageMenuIndicatorItem *)self.viewModel;
    CGFloat lineWidth = model.separatorLineSize.width;
    CGFloat lineHeight = model.separatorLineSize.height;

    self.separatorLine.frame = CGRectMake(self.bounds.size.width - lineWidth + self.viewModel.cellSpacing/2, (self.bounds.size.height - lineHeight)/2.0, lineWidth, lineHeight);
}

- (void)bindViewModel:(JXPageMenuItem *)item {
    [super bindViewModel:item];

    JXPageMenuIndicatorItem *model = (JXPageMenuIndicatorItem *)item;
    self.separatorLine.backgroundColor = model.separatorLineColor;
    self.separatorLine.hidden = !model.isSepratorLineShowEnabled;

    if (model.isCellBackgroundColorGradientEnabled) {
        if (model.isSelected) {
            self.contentView.backgroundColor = model.cellBackgroundSelectedColor;
        }else {
            self.contentView.backgroundColor = model.cellBackgroundUnselectedColor;
        }
    }
}

@end
