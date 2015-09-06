//
//  PALifeDetailViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PALifeDetailViewController.h"

@implementation PALifeDetailViewController

@synthesize data;
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 60, 20)];
    [backButton setTitle:@"< 关闭" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *passValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 350, 20)];
    passValueLabel.text = data;
    [self.view addSubview:backButton];
    [self.view addSubview:passValueLabel];
}

#pragma mark - Action

- (void)backButtonClicked:(UIButton *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}

@end
