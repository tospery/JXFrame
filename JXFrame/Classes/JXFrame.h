//
//  JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

#pragma mark - Defines
#import "JXConst.h"
#import "JXType.h"
#import "JXFunction.h"
#import "JXString.h"

#pragma mark - Model
#import "JXObject.h"
#import "JXBaseModel.h"
#import "JXAppDependency.h"
#import "JXFrameManager.h"
#import "JXNavigator.h"
#import "JXProvider.h"
#import "JXUser.h"
#import "JXPageFactory.h"
#import "JXPageMenuIndicatorModel.h"
#import "JXPageMenuAnimator.h"

#pragma mark - ViewModel
#import "JXBaseViewModel.h"
#import "JXScrollViewModel.h"
#import "JXTableViewModel.h"
#import "JXCollectionViewModel.h"
#import "JXTabBarViewModel.h"
#import "JXPageViewModel.h"
#import "JXWebViewModel.h"
#import "JXLoginViewModel.h"
#import "JXBaseItem.h"
#import "JXTableItem.h"
#import "JXCollectionItem.h"
#import "JXPageMenuItem.h"
#import "JXPageMenuIndicatorItem.h"
#import "JXPageMenuTitleItem.h"

#pragma mark - Controller
#import "JXBaseViewController.h"
#import "JXScrollViewController.h"
#import "JXTableViewController.h"
#import "JXCollectionViewController.h"
#import "JXTabBarViewController.h"
#import "JXPageViewController.h"
#import "JXWebViewController.h"
#import "JXLoginViewController.h"
#import "JXNavigationController.h"

#pragma mark - View
#import "JXBaseView.h"
#import "JXTableCell.h"
#import "JXCollectionCell.h"
#import "JXSupplementaryView.h"
#import "JXWebProgressView.h"
#import "JXPageMenuCollectionView.h"
#import "JXPageContainerView.h"
#import "JXPageMenuIndicatorCell.h"
#import "JXPageMenuIndicatorView.h"
#import "JXPageMenuIndicatorComponentView.h"
#import "JXPageMenuIndicatorBackgroundView.h"
#import "JXPageMenuIndicatorLineView.h"
#import "JXPageMenuTitleCell.h"
#import "JXPageMenuTitleView.h"
#import "JXLabel.h"
#import "JXButton.h"

#pragma mark - Category
#import "NSObject+JXFrame.h"
#import "NSString+JXFrame.h"
#import "NSNumber+JXFrame.h"
#import "NSArray+JXFrame.h"
#import "NSDictionary+JXFrame.h"
#import "NSURL+JXFrame.h"
#import "NSAttributedString+JXFrame.h"
#import "NSError+JXFrame.h"
#import "NSBundle+JXFrame.h"
#import "UIImage+JXFrame.h"
#import "UIView+JXFrame.h"
#import "UIScrollView+JXFrame.h"
#import "UINavigationBar+JXFrame.h"
#import "UIApplication+JXFrame.h"
#import "UIColor+JXFrame.h"
#import "UIDevice+JXFrame.h"
#import "UIViewController+JXFrame.h"

#pragma mark - Protocol
#import "JXIdentifiable.h"
#import "JXReactiveView.h"
#import "JXNavigationProtocol.h"
#import "JXProvisionProtocol.h"
#import "JXPageMenuIndicator.h"
#import "JXPageContainerProtocol.h"
#import "JXPageContentProtocol.h"

#pragma mark - Vendor
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>
#import <Mantle/Mantle.h>
#import <PINCache/PINCache.h>
#import <JLRoutes/JLRoutes.h>
#import <JLRoutes/JLRRouteHandler.h>
#import <JLRoutes/JLRRouteDefinition.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <OvercoatObjC/OvercoatObjC.h>
#import <UICKeyChainStore/UICKeyChainStore.h>
#import <FCUUID/FCUUID.h>
#import <SDWebImage/SDWebImage.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <TYAlertController/TYAlertController.h>
#import <DKNightVersion/DKNightVersion.h>

@interface JXFrame : NSObject

@end
