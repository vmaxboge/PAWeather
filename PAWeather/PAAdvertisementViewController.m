//
//  PAAdvertisementViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PAAdvertisementViewController.h"

@implementation PAAdvertisementViewController


#pragma mark - Life Cycle


- (void)viewDidLoad
{
    UILabel *locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(127, 30, 120, 20)];
    locationLabel.text = @"广告推荐页面";
    [self.view addSubview:locationLabel];
    
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 60, 20)];
    [backButton setTitle:@"< 关闭" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark - Action


- (void)backButtonClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
