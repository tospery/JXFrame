//
//  JXReactiveView.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/30.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JXReactiveView <NSObject>
- (void)bindViewModel:(id)viewModel;

@end

