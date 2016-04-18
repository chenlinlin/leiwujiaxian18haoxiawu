//
//  CityCodeTableViewController.h
//  YiYuanWeather
//
//  Created by lanou3g on 16/1/24.
//  Copyright © 2016年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityCodeTableViewController : UITableViewController

//定义Block
typedef void (^MyBlock) (NSString *);


//声明Block
@property(nonatomic, copy)MyBlock blockCity;



@end
