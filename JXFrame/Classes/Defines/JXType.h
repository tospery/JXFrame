//
//  JXType.h
//  ReactHub
//
//  Created by 杨建祥 on 2019/12/28.
//  Copyright © 2019 杨建祥. All rights reserved.
//

#ifndef JXType_h
#define JXType_h

typedef void        (^JXVoidBlock)(void);
typedef BOOL        (^JXBoolBlock)(void);
typedef NSInteger   (^JXIntBlock) (void);
typedef id          (^JXIdBlock)  (void);

typedef void        (^JXVoidBlock_bool)(BOOL);
typedef BOOL        (^JXBoolBlock_bool)(BOOL);
typedef NSInteger   (^JXIntBlock_bool) (BOOL);
typedef id          (^JXIdBlock_bool)  (BOOL);

typedef void        (^JXVoidBlock_int)(NSInteger);
typedef BOOL        (^JXBoolBlock_int)(NSInteger);
typedef NSInteger   (^JXIntBlock_int) (NSInteger);
typedef id          (^JXIdBlock_int)  (NSInteger);

typedef void        (^JXVoidBlock_string)(NSString *);
typedef BOOL        (^JXBoolBlock_string)(NSString *);
typedef NSInteger   (^JXIntBlock_string) (NSString *);
typedef id          (^JXIdBlock_string)  (NSString *);

typedef void        (^JXVoidBlock_id)(id);
typedef BOOL        (^JXBoolBlock_id)(id);
typedef NSInteger   (^JXIntBlock_id) (id);
typedef id          (^JXIdBlock_id)  (id);


typedef NS_ENUM(NSInteger, JXPageKey){
    JXPageKeyNone,
    JXPageKeyWeb = 1,                   // 普通网页
    JXPageKeyInteractiveWeb,            // 交互网页
    JXPageKeyGuide,                     // 引导页
    JXPageKeyLogin                      // 登录页
};

typedef NS_ENUM(NSInteger, JXRequestMode) {
    JXRequestModeNone,
    JXRequestModeLoad,
    JXRequestModeUpdate,
    JXRequestModeRefresh,
    JXRequestModeMore,
    JXRequestModeToast
};

typedef NS_ENUM(NSInteger, JXReturnType){
    JXReturnTypeBack,
    JXReturnTypeClose
};

typedef NS_ENUM(NSInteger, JXPageComponentPosition){
    JXPageComponentPositionBottom,
    JXPageComponentPositionTop
};

typedef NS_ENUM(NSInteger, JXPageCellClickedPosition){
    JXPageCellClickedPositionLeft,
    JXPageCellClickedPositionRight
};

typedef NS_ENUM(NSUInteger, JXPageMenuCellState) {
    JXPageMenuCellStateSelected,
    JXPageMenuCellStateNormal,
};

typedef NS_ENUM(NSUInteger, JXPageMenuViewStyle) {
    JXPageMenuViewStyleDefault,
    JXPageMenuViewStyleLine,
    JXPageMenuViewStyleTriangle,
    JXPageMenuViewStyleFlood,
    JXPageMenuViewStyleFloodHollow,
    JXPageMenuViewStyleSegmented
};

typedef NS_ENUM(NSUInteger, JXPageMenuViewLayout) {
    JXPageMenuViewLayoutScatter,
    JXPageMenuViewLayoutLeft,
    JXPageMenuViewLayoutRight,
    JXPageMenuViewLayoutCenter
};

typedef NS_ENUM(NSInteger, JXErrorCode){
    JXErrorCodeSuccess = 200,
    JXErrorCodeOK = JXErrorCodeSuccess, // 2xx的状态码表示请求成功
    JXErrorCodeCreated,
    JXErrorCodeAccepted,
    JXErrorCodeNonAuthInfo,
    JXErrorCodeNoContent,
    JXErrorCodeResetContent,
    JXErrorCodePartialContent,
    JXErrorCodeMultipleChoices = 300, // 3xxx重定向错误
    JXErrorCodeMovedPermanently,
    JXErrorCodeFound,
    JXErrorCodeSeeOther,
    JXErrorCodeNotModified,
    JXErrorCodeUseProxy,
    JXErrorCodeUnused,
    JXErrorCodeTemporaryRedirect,
    JXErrorCodeBadRequest = 400,  // 4xx客户端错误
    JXErrorCodeUnauthorized,
    JXErrorCodePaymentRequired,
    JXErrorCodeForbidden,
    JXErrorCodeNotFound,
    JXErrorCodeMethodNotAllowed,
    JXErrorCodeNotAcceptable,
    JXErrorCodeProxyAuthRequired,
    JXErrorCodeRequestTimeout,
    JXErrorCodeConflict,
    JXErrorCodeGone,
    JXErrorCodeLengthRequired,
    JXErrorCodePreconditionFailed,
    JXErrorCodeRequestEntityTooLarge,
    JXErrorCodeRequestURITooLong,
    JXErrorCodeUnsupportedMediaType,
    JXErrorCodeRequestedRangeNotSatisfiable,
    JXErrorCodeExpectationFailed,
    JXErrorCodeInternalServerError = 500, // 5xx服务器错误
    JXErrorCodeNotImplemented,
    JXErrorCodeBadGateway,
    JXErrorCodeServiceUnavailable,
    JXErrorCodeGatewayTimeout,
    JXErrorCodeHTTPVersionNotSupported,
    
    JXErrorCodePlaceholder = 10000,      // App自定义错误
    JXErrorCodeNetwork,
    JXErrorCodeServer,
    JXErrorCodeData,
    JXErrorCodeLoginUnfinished,
    JXErrorCodeExpired,
    JXErrorCodeLoginFailure,
    JXErrorCodeArgumentInvalid,
    
    JXErrorCodeEmpty,
    JXErrorCodeLoginHasnotAccount,
    JXErrorCodeLoginWrongPassword,
    JXErrorCodeLoginNotPermission,
    JXErrorCodeSigninFailure,
    JXErrorCodeLocateClosed,
    JXErrorCodeLocateDenied,
    JXErrorCodeLocateFailure,
    JXErrorCodeDeviceNotSupport,
    JXErrorCodeFileNotPicture,
    JXErrorCodeCheckUpdateFailure,
    JXErrorCodeExecuteFailure,
    JXErrorCodeActionFailure,
    JXErrorCodeParseFailure,
    
    JXErrorCodeTotal
};

typedef void(^JXPageMenuCellSelectedAnimationBlock)(CGFloat percent);

typedef NS_ENUM(NSUInteger, JXPageMenuComponentPosition) {
    JXPageMenuComponentPositionBottom,
    JXPageMenuComponentPositionTop,
};

// cell被选中的类型
typedef NS_ENUM(NSUInteger, JXPageMenuCellSelectedType) {
    JXPageMenuCellSelectedTypeUnknown,          //未知，不是选中（cellForRow方法里面、两个cell过渡时）
    JXPageMenuCellSelectedTypeClick,            //点击选中
    JXPageMenuCellSelectedTypeCode,             //调用方法`- (void)selectItemAtIndex:(NSInteger)index`选中
    JXPageMenuCellSelectedTypeScroll            //通过滚动到某个cell选中
};

typedef NS_ENUM(NSUInteger, JXPageMenuTitleLabelAnchorPointStyle) {
    JXPageMenuTitleLabelAnchorPointStyleCenter,
    JXPageMenuTitleLabelAnchorPointStyleTop,
    JXPageMenuTitleLabelAnchorPointStyleBottom,
};

typedef NS_ENUM(NSUInteger, JXPageMenuIndicatorScrollStyle) {
    JXPageMenuIndicatorScrollStyleSimple,                   //简单滚动，即从当前位置过渡到目标位置
    JXPageMenuIndicatorScrollStyleSameAsUserScroll,         //和用户左右滚动列表时的效果一样
};


#endif /* JXType_h */
