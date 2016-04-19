//
//  WeatherView.m
//  乐无极限
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "WeatherView.h"
#import "Header.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@implementation WeatherView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self addCustomView];
        NSLog(@"zou了");
    }
    
    return self;
}


-(void)addCustomView{
    
    _dView  =[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
//    _dView.image =[UIImage imageNamed:@"tu.png"];
    [self addSubview:_dView];
    
    self.cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4+kWidth/5*2, (kHeight/5-42)/2+22, kWidth/10*3, (kHeight/5-42)/2)];
    //    _cityLabel.backgroundColor = [UIColor blueColor];
    _cityLabel.font = [UIFont boldSystemFontOfSize:25];
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_cityLabel];
    
    self.temperaLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4-10, kHeight/5-10, kWidth/2.5, 20)];
    self.temperaLabel.textAlignment =NSTextAlignmentLeft;
    _temperaLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_temperaLabel];
    
    self.weatherTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, kHeight/5+40, kWidth/6, 20)];
    _weatherTypeLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_weatherTypeLabel];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4+kWidth/5*2-20, kHeight/5-20, kWidth/5*2, 20)];
    //    _dateLabel.backgroundColor = [UIColor lightTextColor];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_dateLabel];
    UILabel *label =[[UILabel alloc] initWithFrame:CGRectMake(30, 30, 50, 30)];
    label.text =@"白天";
    label.font=[UIFont systemFontOfSize:24];
    [_dView addSubview:label];
    _picView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 60, kWidth/4, kHeight/5-42)];
    //    _picView.backgroundColor = [UIColor cyanColor];
    [_dView addSubview:_picView];
    
    
    UILabel *day = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4, 22, kWidth/5+10, (kHeight/5-42)/2)];
    day.text = @"最高气温:";
    day.font = [UIFont boldSystemFontOfSize:16];
    day.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:day];
    
    UILabel *night = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4, (kHeight/5-42)/2+22, kWidth/5+10, (kHeight/5-42)/2)];
    night.text = @"最低温度:";
    night.font = [UIFont boldSystemFontOfSize:16];
    night.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:night];
    
    _daytemperaLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4+kWidth/5, 22, kWidth/6, (kHeight/5-42)/2)];
    _daytemperaLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_daytemperaLabel];
    
    _nighttemperaLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth/4+kWidth/5, (kHeight/5-42)/2+22, kWidth/6, (kHeight/5-42)/2)];
    _nighttemperaLabel.textAlignment = NSTextAlignmentCenter;
    [_dView addSubview:_nighttemperaLabel];
    
    _RecentlyLabel =[[UILabel alloc] initWithFrame:CGRectMake(kWidth/4-10,kHeight/5+40, kWidth/4+20,20)];
    [_dView addSubview:_RecentlyLabel];
    
    self.fengLabel =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.RecentlyLabel.frame)+10, kHeight/5+40, kWidth-self.RecentlyLabel.frame.size.width-self.weatherTypeLabel.frame.size.width-25+10, 20)];
 
    self.fengLabel.textAlignment =NSTextAlignmentCenter;
    [self.dView addSubview:self.fengLabel];
    self.kongqiLabel =[[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.fengLabel.frame)+35, 120, 20)];
    _kongqiLabel.text=@"空气质量 ->";
    [self.dView addSubview:_kongqiLabel];
    
    self.zhiliangLabel =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.kongqiLabel.frame), CGRectGetMaxY(self.fengLabel.frame)+35, 150, 20)];
    self.zhiliangLabel.font =[UIFont systemFontOfSize:24];
    self.zhiliangLabel.textColor =[UIColor redColor];
    [self.dView addSubview:self.zhiliangLabel];
    
    
    
}

@end
