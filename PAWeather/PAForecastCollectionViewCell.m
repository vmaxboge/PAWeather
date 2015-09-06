//
//  PAForecastCollectionViewCell.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/2.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PAForecastCollectionViewCell.h"

@implementation PAForecastCollectionViewCell

 - (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        self.forecastCellImageView = [[UIImageView alloc]initWithFrame:CGRectMake(26, 20, 48, 48)];
        [self addSubview:self.forecastCellImageView];
        
        self.forecastCellLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 68, 100, 32)];
        self.forecastCellLabel.textColor = [UIColor whiteColor];
        self.forecastCellLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        self.forecastCellLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.forecastCellLabel];
    }
    return self;
}

@end
