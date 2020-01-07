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
#import "JXFunc.h"
#import "JXStrs.h"

#pragma mark - Model
#import "JXBaseModel.h"
#import "JXAppDependency.h"
#import "JXFrameManager.h"
#import "JXNavigator.h"
#import "JXProvider.h"
#import "JXUser.h"
#import "JXPrompt.h"
#import "JXBaseItem.h"
#import "JXTableItem.h"
#import "JXCollectionItem.h"

#pragma mark - ViewModel
#import "JXBaseViewModel.h"
#import "JXScrollViewModel.h"
#import "JXTableViewModel.h"
#import "JXCollectionViewModel.h"
#import "JXTabBarViewModel.h"
#import "JXLoginViewModel.h"

#pragma mark - Controller
#import "JXBaseViewController.h"
#import "JXScrollViewController.h"
#import "JXTableViewController.h"
#import "JXCollectionViewController.h"
#import "JXTabBarViewController.h"
#import "JXLoginViewController.h"
#import "JXNavigationController.h"

#pragma mark - View
#import "JXBaseView.h"
#import "JXTableCell.h"
#import "JXCollectionCell.h"
#import "JXSupplementaryView.h"

#pragma mark - Category
#import "NSString+JXFrame.h"
#import "NSNumber+JXFrame.h"
#import "NSArray+JXFrame.h"
#import "NSDictionary+JXFrame.h"
#import "NSURL+JXFrame.h"
#import "NSAttributedString+JXFrame.h"
#import "UIView+JXFrame.h"
#import "UIScrollView+JXFrame.h"
#import "UINavigationBar+JXFrame.h"
#import "UIApplication+JXFrame.h"
#import "UIColor+JXFrame.h"
#import "UIDevice+JXFrame.h"

#pragma mark - Protocol
#import "JXReactiveView.h"
#import "JXNavigationProtocol.h"
#import "JXProvisionProtocol.h"

#pragma mark - Vendor
#import <ReactiveObjC/ReactiveObjC.h>
#import <Mantle/Mantle.h>
#import <PINCache/PINCache.h>
#import <JLRoutes/JLRoutes.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <OvercoatObjC/OvercoatObjC.h>
#import <UICKeyChainStore/UICKeyChainStore.h>
#import <FCUUID/FCUUID.h>

@interface JXFrame : NSObject

@end
