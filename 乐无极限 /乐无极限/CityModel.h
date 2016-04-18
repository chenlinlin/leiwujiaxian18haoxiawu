//
//  CityModel.h
//  YiYuanWeather
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityModel : NSObject
//
@property(nonatomic, assign)NSString *c1;//区号
@property(nonatomic, strong)NSString *c3;//城市名
@property(nonatomic,strong)NSMutableDictionary *cityInfo;
@property(nonatomic, strong)NSMutableString *day;//年月日
@property(nonatomic, strong)NSString *weekday;//星期
@property(nonatomic,strong)NSMutableDictionary *f1;
@property(nonatomic, strong)NSString *temperature;//now
@property(nonatomic, strong)NSString *weather;//now
@property(nonatomic, strong)NSString *weather_pic;//now
@property(nonatomic, strong)NSMutableDictionary *now;
//@property(nonatomic, assign)float latitude;
//@property(nonatomic, assign)float longitude;

@property(nonatomic, assign)NSString *day_air_temperature;
@property(nonatomic, assign)NSString *night_air_temperature;
@property(nonatomic,strong)NSMutableDictionary *f2;

@property(nonatomic, strong)NSString *wind_direction;
@property(nonatomic, strong)NSString *wind_power;
@property(nonatomic, strong)NSString *ziwaixian;

//@property(nonatomic, assign)float day_weather_code;
//@property(nonatomic, assign)float night_weather_code;
//@property(nonatomic, strong)NSString *night_weather_pic;



@end
