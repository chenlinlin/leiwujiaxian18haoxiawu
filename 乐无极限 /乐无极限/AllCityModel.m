//
//  CityModel.m
//  jiexi City
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import "AllCityModel.h"

@implementation AllCityModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _city_name];
}

@end

