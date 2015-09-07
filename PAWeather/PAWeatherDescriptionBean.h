//
//  WeatherDescriptionObject.h
//  PAWeather
//
//  Created by 史宁波 on 15/9/1.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAWeatherDescriptionBean : NSObject

@property (nonatomic, copy) NSString *degree;//度数

@property (nonatomic, copy) NSString *weatherCondition;//天气情况，如晴，多云等

@property (nonatomic, copy) NSString *sendibleTemperature;//体感温度

@property (nonatomic, copy) NSString *wind;//风力

@property (nonatomic, copy) NSString *humidity;//湿度

@end
