//
//  TourismCell.m
//  乐无极限
//
//  Created by lanou3g on 16/4/18.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "TourismCell.h"
#import "Header.h"
@implementation TourismCell




- (void)awakeFromNib {
    // Initialization code
    self.imgView.layer.masksToBounds =YES;
    self.imgView.layer.cornerRadius =10;
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
