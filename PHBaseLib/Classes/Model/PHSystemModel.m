//
// PHSystemModel.m 
//
// Created By 项普华 Version: 2.0
// Copyright (C) 2017/08/06  By AlexXiang  All rights reserved.
// email:// xiangpuhua@126.com  tel:// +86 13316987488 
//
//

#import "PHMacro.h"
#import "PHSystemModel.h"



@implementation PHSystemSound

@synthesize soundId;
@synthesize filename;

- (id)init {
	self = [super init];
	if (self) {
		self.soundId = 0;
		self.filename = @"";
	}
	return self;
}

+ (NSDictionary *)ph_keyMapper {
	return @{
				};
}
+ (NSDictionary *)ph_classInArray {
	return @{
				};
}

@end


@implementation PHKeyConfig

@synthesize baiduMapKey;
@synthesize jPushKey;
@synthesize jPushSecret;

- (id)init {
	self = [super init];
	if (self) {
		self.baiduMapKey = @"";
		self.jPushKey = @"";
		self.jPushSecret = @"";
	}
	return self;
}

+ (NSDictionary *)ph_keyMapper {
	return @{
				};
}
+ (NSDictionary *)ph_classInArray {
	return @{
				};
}

@end
