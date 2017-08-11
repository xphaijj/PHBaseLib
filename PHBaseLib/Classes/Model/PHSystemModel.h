//
// PHSystemModel.h 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/08/06  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSDictionary+Safe.h"
#import "PHModel.h"




@class PHSystemSound;
@class PHKeyConfig;


@interface PHSystemSound : PHModel {
}
/**
 
 */
@property (readwrite, nonatomic, assign) NSInteger soundId;
/**
 
 */
@property (readwrite, nonatomic, strong) NSString * filename;

@end


@interface PHKeyConfig : PHModel {
}

PH_ShareInstanceHeader(PHKeyConfig);

/**
 载入配置文件
 
 @param configName 配置文件的名称
 */
+ (void)PH_SystemConfig:(NSString *)configName;

/**
 外界传入的数据 集合
 */
@property (readwrite, nonatomic, strong) NSDictionary *systemConfig;

/**
 上传服务器数据的扩展
 */
@property (readwrite, nonatomic, strong) NSMutableDictionary *request_extras;

/**
 百度地图
 */
@property (readwrite, nonatomic, strong) NSString *baidu_map_key;
/**
 极光推送
 */
@property (readwrite, nonatomic, strong) NSString *jpush_key;
/**
 极光推送
 */
@property (readwrite, nonatomic, strong) NSString *jpush_secret;
/**
 主机域名
 */
@property (readwrite, nonatomic, strong) NSString *host_name;
/**
 基础路径
 */
@property (readwrite, nonatomic, strong) NSString *base_url;


@end
