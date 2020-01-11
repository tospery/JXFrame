//
//  UIImage+JXFrame.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import <UIKit/UIKit.h>

@interface UIImage (JXFrame)

+ (UIImage *)jx_imageURLed:(NSString *)urlString;
+ (UIImage *)jx_imageInAsset:(NSString *)name;
+ (UIImage *)jx_imageInBundle:(NSString *)name;
+ (UIImage *)jx_imageInResource:(NSString *)name;
+ (UIImage *)jx_imageInDocuments:(NSString *)name;

@end

