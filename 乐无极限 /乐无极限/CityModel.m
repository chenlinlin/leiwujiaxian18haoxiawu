//
//  CityModel.m
//  YiYuanWeather
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

-(NSMutableDictionary *)cityInfo
{
    if (!_cityInfo) {
        _cityInfo = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return _cityInfo;
}

-(NSMutableDictionary *)now{
    if (!_now) {
        _now = [NSMutableDictionary dictionaryWithCapacity:3];
    }
    return _now;
}

-(NSMutableDictionary *)f2{
    if (!_f2) {
        _f2 = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return _f2;
}

-(NSMutableDictionary *)f1{
    if (!_f1) {
        _f1 = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return _f1;
}


//- (NSString *)description
//{
////    return [NSString stringWithFormat:@"%@%%%@%@%@", _f1,_cityInfo,_now,_f2];
//}
@end
