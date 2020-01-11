//
//  UIImage+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import "UIImage+JXFrame.h"
#import <CommonCrypto/CommonDigest.h>
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>
#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/SDWebImageDownloader.h>
#import "JXConst.h"
#import "JXFunction.h"
#import "NSString+JXFrame.h"
#import "NSBundle+JXFrame.h"

@implementation UIImage (JXFrame)

+ (UIImage *)jx_imageURLed:(NSString *)urlString {
    NSString *asset = JXStrWithFmt(@"%@://", kJXSchemeAsset);
    if ([urlString hasPrefix:asset]) {
        return [self jx_imageInAsset:[urlString substringFromIndex:asset.length]];
    }
    
    NSString *bundle = JXStrWithFmt(@"%@://", kJXSchemeBundle);
    if ([urlString hasPrefix:bundle]) {
        return [self jx_imageInBundle:[urlString substringFromIndex:bundle.length]];
    }
    
    NSString *resource = JXStrWithFmt(@"%@://", kJXSchemeResource);
    if ([urlString hasPrefix:resource]) {
        return [self jx_imageInResource:[urlString substringFromIndex:resource.length]];
    }
    
    NSString *documents = JXStrWithFmt(@"%@://", kJXSchemeDocuments);
    if ([urlString hasPrefix:documents]) {
        return [self jx_imageInDocuments:[urlString substringFromIndex:documents.length]];
    }
    
    return nil;
}

+ (UIImage *)jx_imageInAsset:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    return [UIImage imageNamed:name];
}

+ (UIImage *)jx_imageInBundle:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSArray *arr = [name componentsSeparatedByString:@"/"];
    if (arr.count != 2) {
        return nil;
    }
    
    NSString *module = arr[0];
    NSString *file = arr[1];
    
    NSBundle *bundle = [NSBundle jx_bundleWithModule:module];
    bundle = [NSBundle bundleWithPath:[bundle pathForResource:module ofType:@"bundle"]];
    
    return [UIImage imageNamed:file inBundle:bundle compatibleWithTraitCollection:nil];
}

+ (UIImage *)jx_imageInResource:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSArray *arr = [name componentsSeparatedByString:@"."];
    if (arr.count != 2) {
        return nil;
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:arr[0] ofType:arr[1]];
    if (filePath.length == 0) {
        return nil;
    }
    
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)jx_imageInDocuments:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    
    NSString *filePath = [NSString jx_filePathInDocuments:name];
    if (filePath.length == 0) {
        return nil;
    }
    
    return [UIImage imageWithContentsOfFile:filePath];
}

@end
