//
//  WeatherView.h
//  乐无极限
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView

@property(nonatomic,strong)UIImageView *dView;
@property(nonatomic, strong)UILabel *cityIdLabel;
@property(nonatomic, strong)UILabel *cityLabel;

@property(nonatomic, strong)UILabel *dateLabel;
@property(nonatomic, strong)UILabel *weekDayLabel;

@property(nonatomic, strong)UILabel *temperaLabel;
@property(nonatomic, strong)UILabel *weatherTypeLabel;
@property(nonatomic, strong)UIImageView *picView;

@property(nonatomic, strong)UILabel *daytemperaLabel;
@property(nonatomic, strong)UILabel *nighttemperaLabel;

@property(nonatomic,strong)UILabel *RecentlyLabel;

@property(nonatomic,strong)UILabel *fengLabel;

@property(nonatomic,strong)UILabel *kongqiLabel;

@property(nonatomic,strong)UILabel *zhiliangLabel;



@end
