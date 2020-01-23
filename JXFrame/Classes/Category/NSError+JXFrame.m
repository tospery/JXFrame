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
#import "UIApplication+JXFrame.h"

@implementation NSError (JXFrame)
- (NSString *)jx_retryTitle {
    return kStringReload;
}

- (NSString *)jx_displayTitle {
    return nil;
}

- (NSString *)jx_displayMessage {
    NSInteger code = self.code;
    NSString *result = kStringUnknownError;
    if (code >= JXErrorCodeCreated && code <= JXErrorCodePartialContent) {
        result = @"HTTP请求错误";
    }else if (code >= JXErrorCodeMultipleChoices && code <= JXErrorCodeTemporaryRedirect) {
        result = @"HTTP重定向错误";
    }else if (code >= JXErrorCodeBadRequest && code <= JXErrorCodeExpectationFailed) {
        result = @"HTTP客户端错误";
    }else if (code >= JXErrorCodeInternalServerError && code <= JXErrorCodeHTTPVersionNotSupported) {
        result = @"HTTP服务器错误";
    }else {
        switch (code) {
            case JXErrorCodePlaceholder: {
                result = @"错误码占位符";
                break;
            }
            case JXErrorCodeServer: {
                result = kStringServerException;
                break;
            }
            case JXErrorCodeNetwork: {
                result = kStringNetworkException;
                break;
            }
            case JXErrorCodeData: {
                result = kStringDataInvalid;
                break;
            }
            case JXErrorCodeLoginUnfinished: {
                result = kStringLoginUnfinished;
                break;
            }
            case JXErrorCodeExpired: {
                result = kStringLoginExpired;
                break;
            }
            case JXErrorCodeLoginFailure: {
                result = kStringLoginFailure;
                break;
            }
            case JXErrorCodeArgumentInvalid: {
                result = kStringArgumentError;
                break;
            }
            case JXErrorCodeEmpty: {
                result = kStringDataEmpty;
                break;
            }
            case JXErrorCodeLoginHasnotAccount: {
                result = kStringLoginHasnotAccount;
                break;
            }
            case JXErrorCodeLoginWrongPassword: {
                result = kStringLoginWrongPassword;
                break;
            }
            case JXErrorCodeLoginNotPermission: {
                result = kStringLoginNotPermission;
                break;
            }
            case JXErrorCodeSigninFailure: {
                result = kStringSigninFailure;
                break;
            }
            case JXErrorCodeLocateClosed: {
                result = kStringLocateClosed;
                break;
            }
            case JXErrorCodeLocateDenied: {
                result = kStringLocateDenied;
                break;
            }
            case JXErrorCodeLocateFailure: {
                result = kStringLocateFailure;
                break;
            }
            case JXErrorCodeDeviceNotSupport: {
                result = kStringDeviceNotSupport;
                break;
            }
            case JXErrorCodeFileNotPicture: {
                result = kStringFileNotPicture;
                break;
            }
            case JXErrorCodeCheckUpdateFailure: {
                result = kStringCheckUpdateFailure;
                break;
            }
            case JXErrorCodeExecuteFailure: {
                result = kStringExecuteFailure;
                break;
            }
            case JXErrorCodeActionFailure: {
                result = kStringActionFailure;
                break;
            }
            case JXErrorCodeParseFailure: {
                result = kStringParseFailure;
                break;
            }
            default:
                break;
        }
    }
    
    return result;
}

- (UIImage *)jx_displayImage {
    UIImage *image = nil;
    switch (self.code) {
        case JXErrorCodeNetwork: {
            image = JXImageBundle(@"jx_error_network");
            break;
        }
        case JXErrorCodeServer: {
            image = JXImageBundle(@"jx_error_server");
            break;
        }
        case JXErrorCodeExpired: {
            image = JXImageBundle(@"jx_error_expired");
            break;
        }
        default: {
            image = JXImageBundle(@"jx_error_empty");
            break;
        }
    }
    return image;
}

- (NSError *)jx_adaptError {
    NSError *error = self;
    switch (self.code) {
            case -1009:
            //error = [NSError jx_errorWithCode:JXErrorCodeNetwork];
            break;
            case -1011:
            case -1004:
            case -1001:
            case 3840:
            //error = [NSError jx_errorWithCode:JXErrorCodeServer];
            break;
        default:
            break;
    }
    return error;
}

// YJX_TODO 清理不需要的图标
//- (UIImage *)jx_reasonImage {
//    UIImage *image = nil;
//    if (JXErrorCodeNetwork == self.code) {
//        image = JXFrameManager.share.networkImage;
//    }else if (JXErrorCodeServer == self.code) {
//        image = JXFrameManager.share.serverImage;
//    }else if (JXErrorCodeExpired == self.code) {
//        image = JXFrameManager.share.expireImage;
//    }else {
//        image = JXFrameManager.share.emptyImage;
//    }
//    return image;
//}

//+ (NSError *)jx_errorWithCode:(JXErrorCode)code {
//    return [NSError jx_errorWithCode:code description:JXErrorCodeString(code)];
//}

+ (NSError *)jx_errorWithCode:(NSInteger)code description:(NSString *)description {
    return [NSError errorWithDomain:UIApplication.sharedApplication.jx_bundleID code:code userInfo:@{NSLocalizedDescriptionKey: JXStrWithDft(description, kStringUnknownError)}];
}

@end


//NSString * JXErrorCodeString(JXErrorCode code) {
//    NSString *result = @"未知错误";
//    if (code >= JXErrorCodeCreated && code <= JXErrorCodePartialContent) {
//        result = @"HTTP请求错误";
//    }else if (code >= JXErrorCodeMultipleChoices && code <= JXErrorCodeTemporaryRedirect) {
//        result = @"HTTP重定向错误";
//    }else if (code >= JXErrorCodeBadRequest && code <= JXErrorCodeExpectationFailed) {
//        result = @"HTTP客户端错误";
//    }else if (code >= JXErrorCodeInternalServerError && code <= JXErrorCodeHTTPVersionNotSupported) {
//        result = @"HTTP服务器错误";
//    }else {
//        switch (code) {
//            case JXErrorCodePlaceholder: {
//                result = @"错误码占位符";
//                break;
//            }
//            case JXErrorCodeServer: {
//                result = kStringServerException;
//                break;
//            }
//            case JXErrorCodeNetwork: {
//                result = kStringNetworkException;
//                break;
//            }
//            case JXErrorCodeData: {
//                result = kStringDataInvalid;
//                break;
//            }
//            case JXErrorCodeLoginUnfinished: {
//                result = kStringLoginUnfinished;
//                break;
//            }
//            case JXErrorCodeExpired: {
//                result = kStringLoginExpired;
//                break;
//            }
//            case JXErrorCodeLoginFailure: {
//                result = kStringLoginFailure;
//                break;
//            }
//            case JXErrorCodeArgumentInvalid: {
//                result = kStringArgumentError;
//                break;
//            }
//            case JXErrorCodeEmpty: {
//                result = kStringDataEmpty;
//                break;
//            }
//            case JXErrorCodeLoginHasnotAccount: {
//                result = kStringLoginHasnotAccount;
//                break;
//            }
//            case JXErrorCodeLoginWrongPassword: {
//                result = kStringLoginWrongPassword;
//                break;
//            }
//            case JXErrorCodeLoginNotPermission: {
//                result = kStringLoginNotPermission;
//                break;
//            }
//            case JXErrorCodeSigninFailure: {
//                result = kStringSigninFailure;
//                break;
//            }
//            case JXErrorCodeLocateClosed: {
//                result = kStringLocateClosed;
//                break;
//            }
//            case JXErrorCodeLocateDenied: {
//                result = kStringLocateDenied;
//                break;
//            }
//            case JXErrorCodeLocateFailure: {
//                result = kStringLocateFailure;
//                break;
//            }
//            case JXErrorCodeDeviceNotSupport: {
//                result = kStringDeviceNotSupport;
//                break;
//            }
//            case JXErrorCodeFileNotPicture: {
//                result = kStringFileNotPicture;
//                break;
//            }
//            case JXErrorCodeCheckUpdateFailure: {
//                result = kStringCheckUpdateFailure;
//                break;
//            }
//            case JXErrorCodeExecuteFailure: {
//                result = kStringExecuteFailure;
//                break;
//            }
//            case JXErrorCodeActionFailure: {
//                result = kStringActionFailure;
//                break;
//            }
//            case JXErrorCodeParseFailure: {
//                result = kStringParseFailure;
//                break;
//            }
//            default:
//                break;
//        }
//    }
//
//    return result;
//}
