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
/**
 百度地图
 */
@property (readwrite, nonatomic, strong) NSString * baiduMapKey;
/**
 极光推送
 */
@property (readwrite, nonatomic, strong) NSString * jPushKey;
/**
 极光推送
 */
@property (readwrite, nonatomic, strong) NSString * jPushSecret;

@end
