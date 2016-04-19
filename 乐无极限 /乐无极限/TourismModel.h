//
//  TourismModel.h
//  乐无极限
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TourismModel : NSObject

@property(nonatomic,assign)NSInteger count;

@property(nonatomic,strong)NSString *myId;

@property(nonatomic,strong)NSString *namec;

@property(nonatomic,strong)NSString *pic;
@property(nonatomic,assign)NSInteger sightCount;
@property(nonatomic,strong)NSString *sightLevel;

@property(nonatomic,assign)NSInteger sellSightCount;

@end
