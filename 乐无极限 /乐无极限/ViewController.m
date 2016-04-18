//
//  ViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecontViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    
    

}

- (void)viewWillAppear:(BOOL)animated{
    FirstViewController *first =[[FirstViewController alloc] init];
    SecontViewController *secont =[[SecontViewController alloc] init];
    ThirdViewController *third =[[ThirdViewController alloc] init];
    FourthViewController *fourth =[[FourthViewController alloc]init];
    FifthViewController *fifth = [[FifthViewController alloc]init];
    first.tabBarItem.title =@"精选";
    secont.tabBarItem.title =@"导航";
    third.tabBarItem.title =@"Vip交友";
    fourth.tabBarItem.title =@"文学";
    fifth.tabBarItem.title = @"我的";
    first.navigationItem.title =@"精华";
    first.tabBarItem.image =[UIImage imageNamed:@"movie"];
    secont.tabBarItem.image =[UIImage imageNamed:@"movie"];
    third.tabBarItem.image =[UIImage imageNamed:@"movie"];
    fourth.tabBarItem.image =[UIImage imageNamed:@"movie"];
    fifth.tabBarItem.image = [UIImage imageNamed:@"movie"];
    UINavigationController *firstNC = [[UINavigationController alloc] initWithRootViewController:first];
    UINavigationController *secontNC = [[UINavigationController alloc] initWithRootViewController:secont];
    UINavigationController *thirdNC = [[UINavigationController alloc] initWithRootViewController:third];
    UINavigationController *fourthNC = [[UINavigationController alloc] initWithRootViewController:fourth];
    UINavigationController *fifthNC = [[UINavigationController alloc] initWithRootViewController:fifth];
    self.viewControllers =@[firstNC,secontNC,thirdNC,fourthNC,fifthNC];
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
