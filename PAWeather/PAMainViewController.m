//
//  ViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/1.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PAMainViewController.h"

@interface PAMainViewController ()

@end

@implementation PAMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSegueWithIdentifier:@"MainViewController" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
