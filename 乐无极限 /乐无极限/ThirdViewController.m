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

}
-(void)tianqi:(id)sender{
    WeatherViewController *weatVC =[[WeatherViewController alloc] init];
//    self.navigationController.navigationBarHidden = YES;
    self.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:weatVC animated:YES];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title =@"第三个";
    
}

//控制器即将消失的时候
-(void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"走了; l");
    [self.but removeFromSuperview];
    [self.but2 removeFromSuperview];
    
}
@end
