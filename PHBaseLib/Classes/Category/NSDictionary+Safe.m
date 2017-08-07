//
//  NSDictionary+SafeAccess.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)
- (BOOL)hasKey:(NSString *)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    BOOL has = NO;
    for (id kk in list) {
        if ([self.allKeys containsObject:kk] && [self objectForKey:kk]) {
            has = YES;
        }
    }
    return has;
}

- (NSString*)stringForKey:(NSString *)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value;
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null])) {
            value = vv;
        }
    }
    if (value == nil || value == [NSNull null]) {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]]) {
        if ([value isEqualToString:@"null"] || [value isEqualToString:@"(null)"]) {
            return @"";
        }
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
       return [value stringValue];
    }
    
    return @"";
}

- (NSNumber *)numberForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv floatValue] == 0)) {
            value = vv;
        }
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)decimalNumberForKey:(id)key {
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv floatValue] == 0)) {
            value = vv;
        }
    }
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}


- (NSArray*)arrayForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null])) {
            value = vv;
        }
    }
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary*)dictionaryForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null])) {
            value = vv;
        }
    }
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)integerForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv intValue] == 0)) {
            value = vv;
        }
    }
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}
- (NSUInteger)unsignedIntegerForKey:(id)key{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv intValue] == 0)) {
            value = vv;
        }
    }
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (id)objForKey:(id)key {
    NSArray *keys = [key componentsSeparatedByString:@","];
    id value = nil;
    for (NSString *kk in keys) {
        NSArray *kkeys = [kk componentsSeparatedByString:@"."];
        if (kkeys.count > 1) {
            id vv = self;
            for (int i = 0; i < kkeys.count; i++) {
                NSString *kkk = kkeys[i];
                if (vv && [vv isKindOfClass:[NSDictionary class]] && [((NSDictionary *)vv).allKeys containsObject:kkk]) {
                    vv = [((NSDictionary *)vv) objectForKey:kkk];
                } else {
                    break;
                }
                if (i == kkeys.count-1) {
                    if (!(vv == nil || vv == [NSNull null])) {
                        value = vv;
                    }
                }
            }
        }
        else {
            id vv = [self objectForKey:kk];
            if (!(vv == nil || vv == [NSNull null])) {
                value = vv;
            }
        }
    }
    
    return value;
}

- (BOOL)boolForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv boolValue] == NO)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}
- (int16_t)int16ForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv intValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int32_t)int32ForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv intValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (int64_t)int64ForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv longLongValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}
- (char)charForKey:(id)key{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null])) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}
- (short)shortForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv intValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}
- (float)floatForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv floatValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}
- (double)doubleForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv doubleValue] == 0)) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}
- (long long)longLongForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv longLongValue] == 0)) {
            value = vv;
        }
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value longLongValue];
    }
    return 0;
}

- (unsigned long long)unsignedLongLongForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv unsignedLongLongValue] == 0)) {
            value = vv;
        }
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        value = [nf numberFromString:value];
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    return 0;
}

- (NSDate *)dateForKey:(id)key dateFormat:(NSString *)dateFormat{
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = nil;
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null])) {
            value = vv;
        }
    }
    
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}


//CG
- (CGFloat)CGFloatForKey:(id)key
{
    NSArray *list = [key componentsSeparatedByString:@","];
    id value = [NSNumber numberWithInt:0];
    
    for (id kk in list) {
        id vv = [self objectForKey:kk];
        if (!(vv == nil || vv == [NSNull null] || [vv doubleValue] == 0)) {
            value = vv;
        }
    }
    
    if ([value isKindOfClass:[NSString class]] &&  ([value isKindOfClass:[NSNull class]] || [value isEqualToString:@"<null>"])) {
        return 0;
    }
    if ([value respondsToSelector:@selector(doubleValue)]) {
        CGFloat f = [value doubleValue];
        return f;
    }
    return 0;
}

- (CGPoint)pointForKey:(id)key
{
    CGPoint point = CGPointFromString(self[key]);
    return point;
}
- (CGSize)sizeForKey:(id)key
{
    CGSize size = CGSizeFromString(self[key]);
    return size;
}
- (CGRect)rectForKey:(id)key
{
    CGRect rect = CGRectFromString(self[key]);
    return rect;
}
@end

#pragma --mark NSMutableDictionary setter
@implementation NSMutableDictionary (SafeAccess)
-(void)setObj:(id)i forKey:(NSString*)key{
    if (i!=nil) {
        self[key] = i;
    }
}
-(void)setString:(NSString*)i forKey:(NSString*)key;
{
    [self setValue:i forKey:key];
}
-(void)setBool:(BOOL)i forKey:(NSString *)key
{
    self[key] = @(i);
}
-(void)setInt:(int)i forKey:(NSString *)key
{
    self[key] = @(i);
}
-(void)setInteger:(NSInteger)i forKey:(NSString *)key
{
    self[key] = @(i);
}
-(void)setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key
{
    self[key] = @(i);
}
-(void)setCGFloat:(CGFloat)f forKey:(NSString *)key
{
    self[key] = @(f);
}
-(void)setChar:(char)c forKey:(NSString *)key
{
    self[key] = @(c);
}
-(void)setFloat:(float)i forKey:(NSString *)key
{
    self[key] = @(i);
}
-(void)setDouble:(double)i forKey:(NSString*)key{
    self[key] = @(i);
}
-(void)setLongLong:(long long)i forKey:(NSString*)key{
    self[key] = @(i);
}
-(void)setPoint:(CGPoint)o forKey:(NSString *)key
{
    self[key] = NSStringFromCGPoint(o);
}
-(void)setSize:(CGSize)o forKey:(NSString *)key
{
    self[key] = NSStringFromCGSize(o);
}
-(void)setRect:(CGRect)o forKey:(NSString *)key
{
    self[key] = NSStringFromCGRect(o);
}
@end
