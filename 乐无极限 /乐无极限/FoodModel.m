//
//  FoodModel.m
//  乐无极限
//
//  Created by lanou3g on 16/4/19.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID=value;
    }
    if ([key isEqualToString:@"description"]) {
        self.desc =value;
    }
    
}
@end
