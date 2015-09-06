//
//  ForecastViewController.h
//  PAWeather
//
//  Created by 史宁波 on 15/9/1.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PAWeatherDescription.h"
#import "PNChart.h"
#import "PAForecastCollectionViewCell.h"
#import "PAFunctionList.h"
#import "PALocationViewController.h"
#import "PAAdvertisementViewController.h"
#import "AppDelegate.h"
@interface PAForecastViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *forecastCollectionView;

@end
