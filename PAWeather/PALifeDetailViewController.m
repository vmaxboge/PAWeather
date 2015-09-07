//
//  PALifeDetailViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PALifeDetailViewController.h"

@implementation PALifeDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 60, 20)];
    [backButton setTitle:@"< 关闭" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    UILabel *passValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 350, 20)];
    passValueLabel.text = self.data;
    [self.view addSubview:passValueLabel];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    NSString *httpUrl = @"http://apis.baidu.com/heweather/pro/weather";
    NSString *httpArg = @"city=beijing";
    [self request: httpUrl withHttpArg: httpArg];
   }


#pragma mark - Action


- (void)backButtonClicked:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - Private


//请求网络数据
- (void)request:(NSString*)httpUrl withHttpArg:(NSString*)HttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"09082f0baf913108dac1f71e4f4961f9" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                               if (error) {
                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                               } else {
                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                   NSLog(@"HttpResponseCode:%ld", responseCode);
                                   NSLog(@"HttpResponseBody %@",responseString);
                               }
                           }];
}

@end


