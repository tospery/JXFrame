//
//  JXLoginViewModel.h
//  Pods
//
//  Created by 杨建祥 on 2020/1/3.
//

#import "JXScrollViewModel.h"
#import "JXType.h"

@protocol JXLoginViewModelDelegate <JXScrollViewModelDelegate>

@end

@interface JXLoginViewModel : JXScrollViewModel
@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic, copy) JXVoidBlock didLoginBlock;

@end

