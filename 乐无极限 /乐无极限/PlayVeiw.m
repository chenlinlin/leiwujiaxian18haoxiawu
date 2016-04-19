//
//  PlayVeiw.m
//  乐无极限
//
//  Created by lanou3g on 16/4/16.
//  Copyright © 2016年 陈林林. All rights reserved.
//

#import "PlayVeiw.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayVeiw ()<AVPlayerViewControllerDelegate>

@end

@implementation PlayVeiw{
    AVPlayerViewController      *_playerController;
    AVPlayer                    *_player;
    AVAudioSession              *_session;
    NSString                    *_urlString;
}

- (id)initWithFrame:(CGRect)frame url:(NSString *)url {
    _urlString = url;
    self = [super initWithFrame:frame];
    if (self) {
        _session = [AVAudioSession sharedInstance];
        [_session setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        _player = [AVPlayer playerWithURL:[NSURL URLWithString:_urlString]];
        _playerController = [[AVPlayerViewController alloc] init];
        _playerController.player = _player;
        _playerController.videoGravity = AVLayerVideoGravityResizeAspect;
        _playerController.delegate = self;
        _playerController.allowsPictureInPicturePlayback = true;    //画中画，iPad可用
//        _playerController.showsPlaybackControls = false;
        
        _playerController.view.translatesAutoresizingMaskIntoConstraints = true;    //AVPlayerViewController 内部可能是用约束写的，这句可以禁用自动约束，消除报错
        _playerController.view.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        [self addSubview:_playerController.view];
        
        
    }
    return self;
}

- (void)play {
    [_playerController.player play];
}
-(void)stop{
    [_playerController.player pause];
}
#pragma mark - AVPlayerViewControllerDelegate
- (void)playerViewControllerWillStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStartPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController failedToStartPictureInPictureWithError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerWillStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (void)playerViewControllerDidStopPictureInPicture:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    NSLog(@"%s", __FUNCTION__);
    return true;
}

- (void)playerViewController:(AVPlayerViewController *)playerViewController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%s", __FUNCTION__);
}






@end
