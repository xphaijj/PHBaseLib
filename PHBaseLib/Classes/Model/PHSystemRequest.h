//
// PHSystemRequest.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/08/06  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "PHMacro.h"
#import "PHSystemModel.h"


@interface PHSystemRequest : AFHTTPSessionManager {
}

+ (instancetype _Nonnull)sharedClient;



@end


