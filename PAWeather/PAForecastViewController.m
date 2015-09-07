//
//  ForecastViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/1.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PAForecastViewController.h"

@implementation PAForecastViewController


#pragma mark - Life Cycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildForecastViewHeader];
    

    //天气预报页滚动条
    UIScrollView *forecastScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 375, 617)];
    [self buildForecastViewFirstSection:forecastScrollView];
    [self buildForecastSecondSection:forecastScrollView];
    [self buildForecastViewThirdSection:forecastScrollView];
    [self buildForecastViewFourthSection:forecastScrollView];
    
    
    CGFloat height = CGRectGetMaxY(self.forecastCollectionView.frame);
    forecastScrollView.contentSize = CGSizeMake(0, height);
    [forecastScrollView setShowsVerticalScrollIndicator:NO];
    
    
    [self.view addSubview:forecastScrollView];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"forecast_bg.jpg"]]];
    
    
    self.optionList = [NSMutableArray arrayWithCapacity:6];
    PAForecastOptionItemBean *optionItem1 = [[PAForecastOptionItemBean alloc]init];
    [optionItem1 setOptionListImageName:@"umbrella"];
    [optionItem1 setOptionListDescription:@"不用带伞"];
    PAForecastOptionItemBean *optionItem2 = [[PAForecastOptionItemBean alloc]init];
    [optionItem2 setOptionListImageName:@"t_shirt"];
    [optionItem2 setOptionListDescription:@"衬衫"];
    PAForecastOptionItemBean *optionItem3 = [[PAForecastOptionItemBean alloc]init];
    [optionItem3 setOptionListImageName:@"vacation"];
    [optionItem3 setOptionListDescription:@"不宜旅行"];
    PAForecastOptionItemBean *optionItem4 = [[PAForecastOptionItemBean alloc]init];
    [optionItem4 setOptionListImageName:@"weather"];
    [optionItem4 setOptionListDescription:@"需要防晒"];
    PAForecastOptionItemBean *optionItem5 = [[PAForecastOptionItemBean alloc]init];
    [optionItem5 setOptionListImageName:@"limit"];
    [optionItem5 setOptionListDescription:@"单号限行"];
    PAForecastOptionItemBean *optionItem6 = [[PAForecastOptionItemBean alloc]init];
    [optionItem6 setOptionListImageName:@"ball"];
    [optionItem6 setOptionListDescription:@"不宜运动"];
    [self.optionList addObject:optionItem1];
    [self.optionList addObject:optionItem2];
    [self.optionList addObject:optionItem3];
    [self.optionList addObject:optionItem4];
    [self.optionList addObject:optionItem5];
    [self.optionList addObject:optionItem6];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - CollectionView


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PAForecastCollectionViewCell *forecastCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ForecastCell" forIndexPath:indexPath];
    PAForecastOptionItemBean *functionObject = [self.optionList objectAtIndex:indexPath.row];
    forecastCell.forecastCellLabel.text = functionObject.optionListDescription;
    forecastCell.forecastCellImageView.image = [UIImage imageNamed:functionObject.optionListImageName];
    return forecastCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    UINavigationController *navigationController = (UINavigationController *)appDelegate.window.rootViewController;
    UITabBarController *tabBarController = [[navigationController viewControllers]objectAtIndex:1];
    [tabBarController setSelectedIndex:1];
}


#pragma mark - Private


//初始化Forecast页面Header
- (void)buildForecastViewHeader
{
    //播报天气按钮
    UIButton *forecastAlarmButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 30, 40, 20)];
    [forecastAlarmButton setImage:[UIImage imageNamed:@"forecast_alarm"]forState:UIControlStateNormal];
    [self.view addSubview:forecastAlarmButton];
    
    
    //城市管理按钮
    UIButton *locationButton = [[UIButton alloc]initWithFrame:CGRectMake(160, 30, 55, 20)];
    [locationButton setTitle:@"+ 深圳" forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(locationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton];
    
    
    //天气分享按钮
    UIButton *shareWeatherButton = [[UIButton alloc]initWithFrame:CGRectMake(300, 30, 40, 20)];
    [shareWeatherButton setImage:[UIImage imageNamed:@"forecast_share_weather"] forState:UIControlStateNormal];
    [shareWeatherButton addTarget:self action:@selector(shareWeatherButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareWeatherButton];
    
    
    //推荐按钮
    UIButton *recomendButton = [[UIButton alloc]initWithFrame:CGRectMake(345, 33, 20, 15)];
    [recomendButton setImage:[UIImage imageNamed:@"forecast_recomend"]forState:UIControlStateNormal];
    [self.view addSubview:recomendButton];
    
    
//    self.navigationController.navigationBarHidden = NO;
//    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
//    [self.navigationController.navigationBar setTranslucent:NO];
}

//初始化Forecast页面第一部分
- (void)buildForecastViewFirstSection:(UIScrollView *)scrollView
{
    //天气发布时间标签
    UILabel *publishTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 86, 21)];
    publishTimeLabel.text = @"[14:02发布]";
    publishTimeLabel.textColor = [UIColor whiteColor];
    publishTimeLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    [scrollView addSubview:publishTimeLabel];
    
    
    //广告推荐按钮
    UIButton *advertisementButton = [[UIButton alloc]initWithFrame:CGRectMake(320, 80, 40, 60)];
    [advertisementButton setImage:[UIImage imageNamed:@"advertisement"] forState:UIControlStateNormal];
    [advertisementButton addTarget:self action:@selector(advertisementButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:advertisementButton];
    
    
    //数据初始化
    PAWeatherDescriptionBean *weatherDescriptionObject = [[PAWeatherDescriptionBean alloc]init];
    [weatherDescriptionObject setDegree:@"28˚"];
    [weatherDescriptionObject setWeatherCondition:@"晴"];
    [weatherDescriptionObject setSendibleTemperature:@"体感温度28˚"];
    [weatherDescriptionObject setWind:@"西南风2级"];
    [weatherDescriptionObject setHumidity:@"湿度89%"];
    
    
    //天气描述详情标签
    UILabel *descriptionLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 204, 80, 54)];
    descriptionLabel1.text = weatherDescriptionObject.degree;
    descriptionLabel1.textColor = [UIColor whiteColor];
    descriptionLabel1.font = [UIFont fontWithName:@"Helvetica-Bold" size:55];
    [scrollView addSubview:descriptionLabel1];
    
    
    UILabel *descriptionLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(92, 234, 17, 21)];
    descriptionLabel2.text = weatherDescriptionObject.weatherCondition;
    descriptionLabel2.textColor = [UIColor whiteColor];
    descriptionLabel2.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    [scrollView addSubview:descriptionLabel2];
    
    
    UILabel *descriptionLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(15, 256, 61, 21)];
    descriptionLabel3.text = weatherDescriptionObject.sendibleTemperature;
    descriptionLabel3.textColor = [UIColor whiteColor];
    descriptionLabel3.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [scrollView addSubview:descriptionLabel3];
    
    
    UILabel *descriptionLabel4 = [[UILabel alloc]initWithFrame:CGRectMake(15, 274, 60, 21)];
    descriptionLabel4.text = weatherDescriptionObject.wind;
    descriptionLabel4.textColor = [UIColor whiteColor];
    descriptionLabel4.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [scrollView addSubview:descriptionLabel4];
    
    
    UILabel *descriptionLabel5 = [[UILabel alloc]initWithFrame:CGRectMake(72, 274, 61, 21)];
    descriptionLabel5.text = weatherDescriptionObject.humidity;
    descriptionLabel5.textColor = [UIColor whiteColor];
    descriptionLabel5.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [scrollView addSubview:descriptionLabel5];
    
    
    //24h按钮
    UIButton *hourButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 298, 42, 20)];
    hourButton.backgroundColor = [UIColor whiteColor];
    hourButton.alpha = 0.3;
    [scrollView addSubview:hourButton];
    UILabel *hourLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 298, 42, 20)];
    hourLabel.text = @"24h";
    hourLabel.textColor = [UIColor whiteColor];
    hourLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [hourLabel setTextAlignment:NSTextAlignmentCenter];
    [scrollView addSubview:hourLabel];
    
    
    //优良等级按钮
    UIButton *conditionButton = [[UIButton alloc]initWithFrame:CGRectMake(78, 298, 42, 20)];
    conditionButton.backgroundColor = [UIColor greenColor];
    [conditionButton setTitle:@"41优" forState:UIControlStateNormal];
    [conditionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    conditionButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    conditionButton.alpha = 0.8;
    [scrollView addSubview:conditionButton];
    
    
    //分隔线
    UILabel *divideLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 330, 345, 1)];
    divideLabel.backgroundColor = [UIColor grayColor];
    divideLabel.alpha = 0.7;
    [scrollView addSubview:divideLabel];
}

//初始化Forecast页面第二部分(一周天气情况)
- (void)buildForecastSecondSection:(UIScrollView *)scrollView
{

    UIScrollView *oneWeekScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 330, 375, 90)];
    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(16, 8, 29, 21)];
    [dayLabel setText:@"今天"];
    [dayLabel setTextColor:[UIColor whiteColor]];
    dayLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [oneWeekScrollView addSubview:dayLabel];
    
    
    UILabel *conditionLabel = [[UILabel alloc]initWithFrame:CGRectMake(48, 10, 33, 15)];
    [conditionLabel setText:@"优"];
    [conditionLabel setTextColor:[UIColor whiteColor]];
    conditionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    conditionLabel.backgroundColor = [UIColor greenColor];
    conditionLabel.alpha = 0.8;
    [conditionLabel setTextAlignment:NSTextAlignmentCenter];
    [oneWeekScrollView addSubview:conditionLabel];
    
    
    UIButton *conditionImageButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 35, 30)];
    [conditionImageButton setBackgroundImage:[UIImage imageNamed:@"one_week_weather"] forState:UIControlStateNormal];
    [oneWeekScrollView addSubview:conditionImageButton];
    
    
    UILabel *highDegreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(48, 30, 18, 18)];
    [highDegreeLabel setText:@"32˚"];
    [highDegreeLabel setTextColor:[UIColor whiteColor]];
    highDegreeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [oneWeekScrollView addSubview:highDegreeLabel];
    
    
    UILabel *lowDegreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(48, 42, 18, 18)];
    [lowDegreeLabel setText:@"28˚"];
    [lowDegreeLabel setTextColor:[UIColor whiteColor]];
    lowDegreeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [oneWeekScrollView addSubview:lowDegreeLabel];
    
    
    UILabel *weatherConditionLabel = [[UILabel alloc]initWithFrame:CGRectMake(34, 58, 18, 18)];
    [weatherConditionLabel setText:@"晴"];
    [weatherConditionLabel setTextColor:[UIColor whiteColor]];
    weatherConditionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:11];
    [oneWeekScrollView addSubview:weatherConditionLabel];
    
    
    //分隔线
    UILabel *divideLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(15, 420, 345, 1)];
    divideLabel2.backgroundColor = [UIColor grayColor];
    divideLabel2.alpha = 0.7;
    [scrollView addSubview:divideLabel2];
    [scrollView addSubview:oneWeekScrollView];
}

//初始化Forecast页面第三部分（图表插件）
- (void)buildForecastViewThirdSection:(UIScrollView *)scrollView
{
    //折线插件
    PNChart * lineChart = [[PNChart alloc] initWithFrame:CGRectMake(0, 418, SCREEN_WIDTH-5, 150)];
    lineChart.backgroundColor = [UIColor clearColor];
    [lineChart setXLabels:@[@"今天",@"周三",@"周四",@"周五",@"周六"]];
    [lineChart setYValues:@[@"1",@"10",@"2",@"6",@"3"]];
    [lineChart strokeChart];
    [scrollView addSubview:lineChart];
    
    
    //分隔线
    UILabel *divideLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(15, 567, 345, 1)];
    divideLabel3.backgroundColor = [UIColor grayColor];
    divideLabel3.alpha = 0.7;
    [scrollView addSubview:divideLabel3];
}

//初始化Forecast页面第四部分（功能列表 CollectionView）
- (void)buildForecastViewFourthSection:(UIScrollView *)scrollView
{
    [self.forecastCollectionView registerClass:[PAForecastCollectionViewCell class] forCellWithReuseIdentifier:@"ForecastCell"];
    self.forecastCollectionView.dataSource = self;
    self.forecastCollectionView.delegate = self;
    self.forecastCollectionView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:self.forecastCollectionView];
}


#pragma mark - Action


- (void)locationButtonClicked:(UIButton *)sender
{
    PALocationViewController *locationViewController = [[PALocationViewController alloc]init];
    [locationViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:locationViewController animated:YES completion:nil];
}

- (void)shareWeatherButtonClicked:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"分享" message:@"分享至其他应用" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"微信", @"微博",@"短信",nil];
    [alertView show];
}

- (void)advertisementButtonClicked:(UIButton *)sender
{
    PAAdvertisementViewController *advertisementViewController = [[PAAdvertisementViewController alloc]init];
    [self  presentViewController:advertisementViewController animated:YES completion:nil];
}
@end
