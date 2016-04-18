//
//  NewsCell.m
//  乐无极限
//
//  Created by lanou3g on 16/4/15.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "NewsCell.h"
#define ScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight   [[UIScreen mainScreen] bounds ].size.height

@implementation NewsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self view];
    }
    return self;
    
}

-(void)view{
    
    self.imgView =[[UIImageView alloc] initWithFrame:CGRectMake(5, 5,100 , 70)];
    
    [self.contentView addSubview:self.imgView];
    self.titelLabel =[[UILabel alloc] initWithFrame:CGRectMake(110, 0, ScreenWidth-120, 35)];
    self.titelLabel.numberOfLines =0;
    self.titelLabel.font =[UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.titelLabel];
    
    self.neirongLabel =[[UILabel alloc] initWithFrame:CGRectMake(110, 35, ScreenWidth-115, 45)];
    self.neirongLabel.numberOfLines =0;
    self.neirongLabel.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.neirongLabel];
    
    self.shijianLabel =[[UILabel alloc] initWithFrame:CGRectMake(5, 85, ScreenWidth, 15)];
    
    self.shijianLabel.font =[UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.shijianLabel];
 
    
}


@end
