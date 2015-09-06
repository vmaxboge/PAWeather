//
//  WeatherDescriptionObject.h
//  PAWeather
//
//  Created by 史宁波 on 15/9/1.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PAWeatherDescription : NSObject

@property (weak, nonatomic) NSString *degree;//度数

@property (weak, nonatomic) NSString *weatherCondition;//天气情况，如晴，多云等

@property (weak, nonatomic) NSString *sendibleTemperature;//体感温度

@property (weak, nonatomic) NSString *wind;//风力

@property (weak, nonatomic) NSString *humidity;//湿度

@end
