//
//  PalMountainAndCloudView.m
//  MountainAndCloudView
//
//  Created by FlyinGeek on 13-2-20.
//  Copyright (c) 2013年 FY. All rights reserved.
//

#import "PalMountainAndCloudView.h"

#define MountainImg @"UIimages/main_bg.jpg"
#define CloudImg_1 @"UIimages/cloud-front.png"
#define CloudImg_2 @"UIimages/cloud-back.png"

@interface PalMountainAndCloudView () 

@property (nonatomic, strong) UIImageView *mountainView;
@property (nonatomic, strong) UIImageView *backCloudView;
@property (nonatomic, strong) UIImageView *frontCloudView;

@end


@implementation PalMountainAndCloudView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup
{
    if (self.subviews.count == 3) {
        [self.mountainView removeFromSuperview];
        [self.backCloudView removeFromSuperview];
        [self.frontCloudView removeFromSuperview];
    }
    
    _mountainView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1178, self.bounds.size.height)];
    self.mountainView.image = [UIImage imageNamed:MountainImg];
        
    _backCloudView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1320, self.bounds.size.height)];
    self.backCloudView.image = [UIImage imageNamed:CloudImg_1];
    self.backCloudView.alpha = 0.8;
        
    _frontCloudView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1320, self.bounds.size.height)];
    self.frontCloudView.image = [UIImage imageNamed:CloudImg_2];
        
    [self addSubview:self.mountainView];
    [self addSubview:self.backCloudView];
    [self addSubview:self.frontCloudView];
    
}

- (void) startAnimation
{
    [self startMountainAnimation];
    [self startBackCloudAnimation];
    [self startFrontCloudAnimation];
}

- (void)startMountainAnimation
{
    
    CGRect frame = self.mountainView.frame;
    frame.origin.x = self.mountainView.frame.origin.x;
    self.mountainView.frame = frame;
    
    [UIView beginAnimations:@"mountainAnimation" context:NULL];
    [UIView setAnimationDuration:23.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:99999];

    frame = self.mountainView.frame;
    frame.origin.x = - frame.size.width + 320;
    self.mountainView.frame = frame;

    [UIView commitAnimations];
}

- (void)startBackCloudAnimation
{
    
    CGRect frame = self.backCloudView.frame;
    frame.origin.x = self.backCloudView.frame.origin.x;
    self.backCloudView.frame = frame;
    
    [UIView beginAnimations:@"backCloudAnimation" context:NULL];
    [UIView setAnimationDuration:15.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:99999];
    
    frame = self.backCloudView.frame;
    frame.origin.x = -frame.size.width + 320;
    self.backCloudView.frame = frame;
    
    [UIView commitAnimations];
}

- (void)startFrontCloudAnimation
{
    
    
    CGRect frame = self.frontCloudView.frame;
    frame.origin.x = self.frontCloudView.frame.origin.x;
    self.frontCloudView.frame = frame;
    
    [UIView beginAnimations:@"frontCloudAnimation" context:NULL];
    [UIView setAnimationDuration:8.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:99999];
    
    frame = self.frontCloudView.frame;
    frame.origin.x = -frame.size.width + 320;
    self.frontCloudView.frame = frame;
    
    [UIView commitAnimations];
}

@end