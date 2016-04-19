//
//  PlayVeiw.h
//  乐无极限
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayVeiw : UIView

- (id)initWithFrame:(CGRect)frame url:(NSString *)url;

- (void)play;
//暂停
-(void)stop;
@end
