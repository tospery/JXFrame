//
//  NSError+JXFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/1/11.
//

#import "NSError+JXFrame.h"
#import "JXConst.h"
#import "JXFunction.h"
#import "JXString.h"
#import "JXFrameManager.h"

@implementation NSError (JXFrame)
- (NSError *)jx_adaptError {
    NSError *error = self;
    switch (self.code) {
            case -1009:
            error = [NSError jx_errorWithCode:JXErrorCodeAppNetworkException];
            break;
            case -1011:
            case -1004:
            case -1001:
            case 3840:
            error = [NSError jx_errorWithCode:JXErrorCodeAppServerException];
            break;
        default:
            break;
    }
    return error;
}

- (NSString *)jx_retryTitle {
    NSString *title = nil;
    if (JXErrorCodeAppLoginExpired == self.code) {
        title = kStringReLogin;
    }else if (JXErrorCodeAppDataInvalid == self.code) {
        title = kStringRefreshNow;
    }else {
        title = kStringReload;
    }
    return title;
}

// YJX_TODO 清理不需要的图标
- (UIImage *)jx_reasonImage {
    UIImage *image = nil;
    if (JXErrorCodeAppNetworkException == self.code) {
        image = JXFrameManager.share.networkImage;
    }else if (JXErrorCodeAppServerException == self.code) {
        image = JXFrameManager.share.serverImage;
    }else if (JXErrorCodeAppLoginExpired == self.code) {
        image = JXFrameManager.share.expireImage;
    }else {
        image = JXFrameManager.share.emptyImage;
    }
    return image;
}

+ (NSError *)jx_errorWithCode:(JXErrorCode)code {
    return [NSError jx_errorWithCode:code description:JXErrorCodeString(code)];
}

+ (NSError *)jx_errorWithCode:(NSInteger)code description:(NSString *)description {
    NSString *desc = JXStrWithDft(description, kStringUnknownError);
    return [NSError errorWithDomain:kJXFrameName code:code userInfo:@{NSLocalizedDescriptionKey: desc}];
}

@end


NSString * JXErrorCodeString(JXErrorCode code) {
    NSString *result = @"未知错误";
    if (code >= JXErrorCodeSysCreated && code <= JXErrorCodeSysPartialContent) {
        result = @"HTTP请求错误";
    }else if (code >= JXErrorCodeSysMultipleChoices && code <= JXErrorCodeSysTemporaryRedirect) {
        result = @"HTTP重定向错误";
    }else if (code >= JXErrorCodeSysBadRequest && code <= JXErrorCodeSysExpectationFailed) {
        result = @"HTTP客户端错误";
    }else if (code >= JXErrorCodeSysInternalServerError && code <= JXErrorCodeSysHTTPVersionNotSupported) {
        result = @"HTTP服务器错误";
    }else {
        switch (code) {
            case JXErrorCodeAppPlaceholder: {
                result = @"错误码占位符";
                break;
            }
            case JXErrorCodeAppServerException: {
                result = kStringServerException;
                break;
            }
            case JXErrorCodeAppNetworkException: {
                result = kStringNetworkException;
                break;
            }
            case JXErrorCodeAppDataInvalid: {
                result = kStringDataInvalid;
                break;
            }
            case JXErrorCodeAppLoginUnfinished: {
                result = kStringLoginUnfinished;
                break;
            }
            case JXErrorCodeAppLoginExpired: {
                result = kStringLoginExpired;
                break;
            }
            case JXErrorCodeAppLoginFailure: {
                result = kStringLoginFailure;
                break;
            }
            case JXErrorCodeAppArgumentInvalid: {
                result = kStringArgumentError;
                break;
            }
            case JXErrorCodeAppDataEmpty: {
                result = kStringDataEmpty;
                break;
            }
            case JXErrorCodeAppLoginHasnotAccount: {
                result = kStringLoginHasnotAccount;
                break;
            }
            case JXErrorCodeAppLoginWrongPassword: {
                result = kStringLoginWrongPassword;
                break;
            }
            case JXErrorCodeAppLoginNotPermission: {
                result = kStringLoginNotPermission;
                break;
            }
            case JXErrorCodeAppSigninFailure: {
                result = kStringSigninFailure;
                break;
            }
            case JXErrorCodeAppLocateClosed: {
                result = kStringLocateClosed;
                break;
            }
            case JXErrorCodeAppLocateDenied: {
                result = kStringLocateDenied;
                break;
            }
            case JXErrorCodeAppLocateFailure: {
                result = kStringLocateFailure;
                break;
            }
            case JXErrorCodeAppDeviceNotSupport: {
                result = kStringDeviceNotSupport;
                break;
            }
            case JXErrorCodeAppFileNotPicture: {
                result = kStringFileNotPicture;
                break;
            }
            case JXErrorCodeAppCheckUpdateFailure: {
                result = kStringCheckUpdateFailure;
                break;
            }
            case JXErrorCodeAppExecuteFailure: {
                result = kStringExecuteFailure;
                break;
            }
            case JXErrorCodeAppActionFailure: {
                result = kStringActionFailure;
                break;
            }
            case JXErrorCodeAppParseFailure: {
                result = kStringParseFailure;
                break;
            }
            default:
                break;
        }
    }
    
    return result;
}
