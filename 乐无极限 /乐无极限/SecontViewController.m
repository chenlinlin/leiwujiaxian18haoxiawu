//
//  SecontViewController.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "SecontViewController.h"

@interface SecontViewController ()

@property(nonatomic,strong)UIScrollView *crollView;

@end

@implementation SecontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
self.view.backgroundColor =[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
    self.navigationItem.title =@"第二个";
}

@end
