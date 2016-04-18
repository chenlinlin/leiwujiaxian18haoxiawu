//
//  ThirdViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "ThirdViewController.h"
#import "Header.h"
@interface ThirdViewController ()

@property(nonatomic,strong)UIView *vie11;


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
    
    [self.but setTitle:@"娱乐" forState:(UIControlStateNormal)];
    self.but.frame =CGRectMake(80, -80, 80, 80);
    self.but.layer.cornerRadius=40;
    [self.view addSubview:self.but];
    
    //简单的动画效果
    
    [UIView animateWithDuration:0.4 animations:^{
        self.but.frame= CGRectMake(80, 300, 80, 80);
        
    } completion:^(BOOL finished) {
    }];



}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"3");
    
    self.navigationItem.title =@"第三个";
    
    
}

//控制器即将消失的时候
-(void)viewWillDisappear:(BOOL)animated{
    
    NSLog(@"走了; l");
    [self.but removeFromSuperview];

    
}
@end
