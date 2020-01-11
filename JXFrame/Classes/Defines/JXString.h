//
//  JXStrs.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#ifndef JXStrs_h
#define JXStrs_h

#import "JXFunction.h"

/********************************************************************************************************
 1个字
 ********************************************************************************************************/
#pragma mark - 1个字
#define kStringNone                                                         \
JXT(NSLocalizedString(@"None", @"无"), @"无")

/********************************************************************************************************
 2个字
 ********************************************************************************************************/
#pragma mark - 2个字
#define kStringTakePhoto                                                    \
JXT(NSLocalizedString(@"kStringTakePhoto", @"拍照"), @"拍照")
#define kStringVideoRecord                                                  \
JXT(NSLocalizedString(@"kStringVideoRecord", @"录像"), @"录像")
#define kStringShoot                                                        \
JXT(NSLocalizedString(@"kStringShoot", @"摄影"), @"摄影")
#define kStringCapture                                                      \
JXT(NSLocalizedString(@"kStringCapture", @"拍摄"), @"拍摄")
#define kStringUnknown                                                      \
JXT(NSLocalizedString(@"kStringUnknown", @"未知"), @"未知")
#define kStringVideo                                                        \
JXT(NSLocalizedString(@"kStringVideo", @"视频"), @"视频")
#define kStringRefresh                                                      \
JXT(NSLocalizedString(@"kStringRefresh", @"刷新"), @"刷新")
#define kStringOK                                                           \
JXT(NSLocalizedString(@"OK", @"确定"), @"确定")
#define kStringCancel                                                       \
JXT(NSLocalizedString(@"Cancel", @"取消"), @"取消")
#define kStringTips                                                         \
JXT(NSLocalizedString(@"Tips", @"提示"), @"提示")
#define kStringNumCharsWithEMark                                            \
JXT(NSLocalizedString(@"chars", @"个字！"), @"个字！")
#define kStringErrorWithGuillemet                                           \
JXT(NSLocalizedString(@"【Error】", @"【错误】"), @"【错误】")
#define kStringDismiss                                                      \
JXT(NSLocalizedString(@"Dismiss", @"忽略"), @"忽略")
#define kStringReport                                                       \
JXT(NSLocalizedString(@"Report", @"报告"), @"报告")
#define kStringExit                                                         \
JXT(NSLocalizedString(@"Exit", @"退出"), @"退出")
#define kStringSetting                                                      \
JXT(NSLocalizedString(@"Setting", @"设置"), @"设置")
#define kStringError                                                        \
JXT(NSLocalizedString(@"Error", @"错误"), @"错误")


/********************************************************************************************************
 3个字
 ********************************************************************************************************/
#pragma mark - 3个字
#define kStringPleaseInput                                                  \
JXT(NSLocalizedString(@"Please input", @"请输入"), @"请输入")


/********************************************************************************************************
 4个字
 ********************************************************************************************************/
#pragma mark - 4个字
#define kStringReget                                                                    \
JXT(NSLocalizedString(@"kStringReget", @"重新获取"), @"重新获取")
#define kStringReload                                                                   \
JXT(NSLocalizedString(@"kStringReload", @"重新加载"), @"重新加载")
#define kStringToBeContinued                                                            \
JXT(NSLocalizedString(@"kStringToBeContinued", @"未完待续"), @"未完待续")
#define kStringReLogin                                                                  \
JXT(NSLocalizedString(@"kStringReLogin", @"重新登录"), @"重新登录")
#define kStringRefreshNow                                                               \
JXT(NSLocalizedString(@"kStringRefreshNow", @"立即刷新"), @"立即刷新")
#define kStringParameterExceptionWithEMark                                              \
JXT(NSLocalizedString(@"Parameter exception!", @"参数异常！"), @"参数异常！")
#define kStringSoSorry                                                                  \
JXT(NSLocalizedString(@"So sorry", @"非常抱歉"), @"非常抱歉")
#define kStringExceptionReport                                                          \
JXT(NSLocalizedString(@"Exception report", @"异常报告"), @"异常报告")
#define kStringHandling                                                                 \
JXT(NSLocalizedString(@"Handling ", @"正在处理"), @"正在处理")
#define kStringUnknownError                                                             \
JXT(NSLocalizedString(@"kStringUnknownError", @"未知错误"), @"未知错误")
#define kStringLoginFailure                                                             \
JXT(NSLocalizedString(@"kStringLoginFailure", @"登录失败"), @"登录失败")
#define kStringSigninFailure                                                            \
JXT(NSLocalizedString(@"kStringSigninFailure", @"注册失败"), @"注册失败")
#define kStringLocateFailure                                                            \
JXT(NSLocalizedString(@"kStringLocateFailure", @"定位失败"), @"定位失败")
#define kStringArgumentError                                                            \
JXT(NSLocalizedString(@"kStringArgumentError", @"参数错误"), @"参数错误")
#define kStringExecuteFailure                                                           \
JXT(NSLocalizedString(@"kStringExecuteFailure", @"执行失败"), @"执行失败")
#define kStringActionFailure                                                            \
JXT(NSLocalizedString(@"kStringActionFailure", @"操作失败"), @"操作失败")
#define kStringParseFailure                                                            \
JXT(NSLocalizedString(@"kStringParseFailure", @"解析失败"), @"解析失败")
#define kStringEnvDev                                                        \
JXT(NSLocalizedString(@"kStringEnvDev", @"开发环境"), @"开发环境")
#define kStringEnvHoc                                                        \
JXT(NSLocalizedString(@"kStringEnvHoc", @"测试环境"), @"测试环境")
#define kStringEnvApp                                                        \
JXT(NSLocalizedString(@"kStringEnvApp", @"正式环境"), @"正式环境")


/********************************************************************************************************
 5个字
 ********************************************************************************************************/
#pragma mark - 5个字
#define kStringGetCode                                                                      \
JXT(NSLocalizedString(@"kStringGetCode", @"获取验证码"), @"获取验证码")
#define kStringChooseInvalidFile                                                            \
JXT(NSLocalizedString(@"kStringChooseInvalidFile", @"无效的文件"), @"无效的文件")
#define kStringDataInvalid                                                                  \
JXT(NSLocalizedString(@"kStringDataInvalid", @"无效的数据"), @"无效的数据")
#define kStringPleaseInputAtLeast                                                           \
JXT(NSLocalizedString(@"PleaseInput", @"请输入至少"), @"请输入至少")
#define kStringUnhandledError                                                               \
JXT(NSLocalizedString(@"Unhandled error", @"未处理错误"), @"未处理错误")
#define kStringPasswordNotSame                                                              \
JXT(NSLocalizedString(@"kStringPasswordNotSame", @"密码不一致"), @"密码不一致")
#define kStringInvalidArgument                                                              \
JXT(NSLocalizedString(@"kStringInvalidArgument", @"无效的参数"), @"无效的参数")


/********************************************************************************************************
 超过5个字
 ********************************************************************************************************/
#pragma mark - 超过5个字
#define kStringChooseFromAlbum                                                                          \
JXT(NSLocalizedString(@"kStringChooseFromAlbum", @"从相册中选取"), @"从相册中选取")
#define kStringChooseFromLibrary                                                                          \
JXT(NSLocalizedString(@"kStringChooseFromLibrary", @"从媒体库中选取"), @"从媒体库中选取")

#define kStringTokenInvalid                                                                           \
JXT(NSLocalizedString(@"kStringTokenInvalid", @"登录已过期，请重新登录"), @"登录已过期，请重新登录")
#define kStringComingSoon                                                                           \
JXT(NSLocalizedString(@"kStringComingSoon", @"暂未开放，敬请期待"), @"暂未开放，敬请期待")
#define kStringLocatingFailedOpenWifi                                                                           \
JXT(NSLocalizedString(@"kStringLocatingFailedOpenWifi", @"定位失败，打开WiFi会提高定位的精确度"), @"定位失败，打开WiFi会提高定位的精确度")
#define kStringHTTPRequestError                                                         \
JXT(NSLocalizedString(@"kStringHTTPRequestError", @"HTTP请求错误"), @"HTTP请求错误")
#define kStringHTTPRedirectError                                                        \
JXT(NSLocalizedString(@"kStringHTTPRedirectError", @"HTTP重定向错误"), @"HTTP重定向错误")
#define kStringHTTPClientError                                                          \
JXT(NSLocalizedString(@"kStringHTTPClientError", @"HTTP客户端错误"), @"HTTP客户端错误")
#define kStringHTTPServerError                                                          \
JXT(NSLocalizedString(@"kStringHTTPServerError", @"HTTP服务器错误"), @"HTTP服务器错误")
#define kStringNetworkException                                                         \
JXT(NSLocalizedString(@"kStringNetworkException", @"貌似没有网络，请检查网络"), @"貌似没有网络，请检查网络")
#define kStringServerException                                                          \
JXT(NSLocalizedString(@"kStringServerException", @"服务不给力，请稍后重试"), @"服务不给力，请稍后重试")
#define kStringDataEmpty                                                                \
JXT(NSLocalizedString(@"kStringDataEmpty", @"没有符合条件的数据"), @"没有符合条件的数据")
#define kStringLoginUnfinished                                                          \
JXT(NSLocalizedString(@"kStringLoginUnfinished", @"亲，您还没有登录~"), @"亲，您还没有登录~")
#define kStringLoginExpired                                                             \
JXT(NSLocalizedString(@"kStringLoginExpired", @"您长时间没有使用、请重新登录~"), @"您长时间没有使用、请重新登录~")
#define kStringLoginHasnotAccount                                                       \
JXT(NSLocalizedString(@"kStringLoginHasnotAccount", @"账号不存在，请检查确认"), @"账号不存在，请检查确认")
#define kStringLoginWrongPassword                                                       \
JXT(NSLocalizedString(@"kStringLoginWrongPassword", @"密码错误，请重新输入"), @"密码错误，请重新输入")
#define kStringLoginNotPermission                                                       \
JXT(NSLocalizedString(@"kStringLoginNotPermission", @"您没有登录权限，请联系管理员"), @"您没有登录权限，请联系管理员")
#define kStringLocateClosed                                                             \
JXT(NSLocalizedString(@"kStringLocateClosed", @"定位未开启，请前往设置页面打开"), @"定位未开启，请前往设置页面打开")
#define kStringLocateDenied                                                             \
JXT(NSLocalizedString(@"kStringLocateDenied", @"定位未允许，请前往设置页面确认"), @"定位未允许，请前往设置页面确认")
#define kStringDeviceNotSupport                    \
JXT(NSLocalizedString(@"kStringDeviceNotSupport", @"您的设备不支持该功能"), @"您的设备不支持该功能")
#define kStringFileNotPicture                                                      \
JXT(NSLocalizedString(@"kStringFileNotPicture", @"所选文件不是一张图片，请重新选择"), @"所选文件不是一张图片，请重新选择")
#define kStringCheckUpdateFailure                                                         \
JXT(NSLocalizedString(@"kStringCheckUpdateFailure", @"检查更新失败"), @"检查更新失败")
#define kStringiPhone                                                                   \
JXT(NSLocalizedString(@"iPhone", @"iPhone"), @"iPhone")
#define kStringExceptionExitAtPreviousRuningWithEMark                                                               \
JXT(NSLocalizedString(@"An error occurred on the previous run", @"程序在上次异常退出！"), @"程序在上次异常退出！")
#define kStringLoadFailedWithCommaClickToRetryWithExclam                                                            \
JXT(NSLocalizedString(@"Load failed, click to retry!", @"加载失败，点击重试！"), @"加载失败，点击重试！")
#define kStringYourDeviceNotSupportCallFunction                                                                     \
JXT(NSLocalizedString(@"kStringYourDeviceNotSupportCallFunction", @"您的设备不支持电话功能"), @"您的设备不支持电话功能")
#define kStringYourDeviceNotSupportMessageFunction                                                                     \
JXT(NSLocalizedString(@"kStringYourDeviceNotSupportMessageFunction", @"您的设备不支持短信功能"), @"您的设备不支持短信功能")
#define kStringNotSupportThisDevice                                                                       \
JXT(NSLocalizedString(@"kStringNotSupportThisDevice", @"不支持该设备"), @"不支持该设备")
#define kStringPleaseInputPhoneNumber                                                                               \
JXT(NSLocalizedString(@"PleaseInputPhoneNumber", @"请输入手机号码"), @"请输入手机号码")
#define kStringPleaseInputValidPhone                                                                               \
JXT(NSLocalizedString(@"kStringPleaseInputValidPhone", @"请输入有效的手机号"), @"请输入有效的手机号")
#define kStringPleaseInputValidEmail                                                                               \
JXT(NSLocalizedString(@"kStringPleaseInputValidEmail", @"请输入有效的邮箱"), @"请输入有效的邮箱")
#define kStringPhoneNumberCantAllWhitespace                    \
JXT(NSLocalizedString(@"kStringPhoneNumberCantAllWhitespace", @"手机号码不能全为空格"), @"手机号码不能全为空格")
#define kStringPhoneNumberNeedNotSame                                                                                   \
JXT(NSLocalizedString(@"PhoneNumberNeedNotSame", @"请输入与原手机号码不一样的号码"), @"请输入与原手机号码不一样的号码")
#define kStringEmailNeedNotSame                                                                                   \
JXT(NSLocalizedString(@"kStringEmailNeedNotSame", @"请输入与原邮箱不一样的邮箱"), @"请输入与原邮箱不一样的邮箱")
#define kStringPhoneNumberMustBe11Count                                                                     \
JXT(NSLocalizedString(@"PhoneNumberMustBe11Count", @"手机号码必须是11位"), @"手机号码必须是11位")
#define kStringPhoneNumberFormatError          \
JXT(NSLocalizedString(@"PhoneNumberFormatError", @"手机号码格式错误"), @"手机号码格式错误")
#define kStringPhoneNumberInvalidChar          \
JXT(NSLocalizedString(@"kStringPhoneNumberInvalidChar", @"手机号码不能包含无效字符"), @"手机号码不能包含无效字符")

#define kStringUnhandledCase                    \
JXT(NSLocalizedString(@"UnhandledCase", @"未处理的case！"), @"未处理的case！")
#define kStringCantAllWhitespace                    \
JXT(NSLocalizedString(@"kStringCantAllWhitespace", @"不能全为空格或换行"), @"不能全为空格或换行")
#define kStringCantLTWhitespace                    \
JXT(NSLocalizedString(@"kStringCantLTWhitespace", @"首尾不能包含空格或换行"), @"首尾不能包含空格或换行")
#define kStringMustASCIIChars                    \
JXT(NSLocalizedString(@"kStringMustASCIIChars", @"只能为字母或数字"), @"只能为字母或数字")
#define kStringLocationServiceIsClosedPleaseToOpenInSetting                    \
JXT(NSLocalizedString(@"kStringLocationServiceIsClosedPleaseToOpenInSetting", @"定位服务已关闭，请前往设置页打开"), @"定位服务已关闭，请前往设置页打开")
#define kStringLocationServiceIsRejectedPleaseToOpenInSetting                    \
JXT(NSLocalizedString(@"kStringLocationServiceIsRejectedPleaseToOpenInSetting", @"定位服务已拒绝，请前往设置页打开"), @"定位服务已拒绝，请前往设置页打开")
#define kStringBackToSeeEffect                    \
JXT(NSLocalizedString(@"kStringBackToSeeEffect", @"直接返回查看效果"), @"直接返回查看效果")

#endif /* JXStrs_h */
