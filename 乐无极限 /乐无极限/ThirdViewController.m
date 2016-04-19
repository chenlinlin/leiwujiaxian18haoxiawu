//
//  ThirdViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "ThirdViewController.h"
#import "Header.h"
#import "WeatherView.h"
#import "CityModel.h"
#import "WeatherViewController.h"
#import "TourismTableViewController.h"
#import "FoodTableViewController.h"
@interface ThirdViewController ()
@property(nonatomic,strong)UIButton *but;
@property(nonatomic,strong)UIButton *but2;
@property(nonatomic,strong)UIButton *but3;
@property(nonatomic,strong)UIButton *but4;

@end

@implementation ThirdViewController
//控制器即将出现的时候
-(void)viewDidAppear:(BOOL)animated{

    self.view.backgroundColor =[UIColor yellowColor];
    self.but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.but.backgroundColor =[UIColor redColor];
    [self.but addTarget:self action:@selector(lvyou:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.but setTitle:@"旅游" forState:(UIControlStateNormal)];
    self.but.frame =CGRectMake(60, -80, 80, 80);
    self.but.layer.cornerRadius=40;
    [self.view addSubview:self.but];
    //简单的动画效果
    [UIView animateWithDuration:0.3 animations:^{
        self.but.frame= CGRectMake(60, ScreenHeight-200, 80, 80);
        
    } completion:^(BOOL finished) {
    }];
    
    self.but2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.but2.backgroundColor =[UIColor redColor];
    [self.but2 setTitle:@"天气" forState:(UIControlStateNormal)];
    self.but2.frame =CGRectMake(ScreenWidth-140, -80, 80, 80);
    self.but2.layer.cornerRadius=40;
    [self.but2 addTarget:self action:@selector(tianqi:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.but2];
    //简单的动画效果
    [UIView animateWithDuration:0.45 animations:^{
        self.but2.frame= CGRectMake(ScreenWidth-140, ScreenHeight-200, 80, 80);
        
    } completion:^(BOOL finished) {
    }];
    self.but3 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.but3 setTitle:@"吃" forState:(UIControlStateNormal)];
    self.but3.frame =CGRectMake(60, -80, 80, 80);
    self.but3.layer.cornerRadius =40;
    self.but3.backgroundColor =[UIColor redColor];
    [self.but3 addTarget:self action:@selector(chi:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.but3];
    //简单的动画效果
    [UIView animateWithDuration:0.6 animations:^{
        self.but3.frame= CGRectMake(60, ScreenHeight-350, 80, 80);
        
    } completion:^(BOOL finished) {
    }];
    

}
-(void)chi:(id)sender{
    FoodTableViewController *foodVC =[[FoodTableViewController alloc] init];
    
    
    [self.navigationController pushViewController:foodVC animated:YES];
    
    
}
-(void)tianqi:(id)sender{
    WeatherViewController *weatVC =[[WeatherViewController alloc] init];
//    self.navigationController.navigationBarHidden = YES;
//    self.hidesBottomBarWhenPushed=YES;

    [self.navigationController pushViewController:weatVC animated:YES];
}
-(void)lvyou:(id)sender{
    TourismTableViewController *tourVC =[[TourismTableViewController alloc] init];
//    self.hidesBottomBarWhenPushed=YES;

    [self.navigationController pushViewController:tourVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title =@"第三个";
    
}
//
//控制器即将消失的时候
-(void)viewWillDisappear:(BOOL)animated{
    
    [self.but removeFromSuperview];
    [self.but2 removeFromSuperview];
    [self.but3 removeFromSuperview];

}
@end
