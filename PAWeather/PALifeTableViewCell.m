//
//  PALifeTableViewCell.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PALifeTableViewCell.h"

@implementation PALifeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.divideLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 10)];
        self.divideLabel.backgroundColor = [UIColor lightGrayColor];
        self.divideLabel.alpha = 0.1;
        [self addSubview:self.divideLabel];
        
        
        self.typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 45, 25)];
        self.typeLabel.backgroundColor = [UIColor greenColor];
        self.typeLabel.textColor = [UIColor whiteColor];
        self.typeLabel.alpha = 0.8;
        self.typeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        self.typeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.typeLabel];
        
        
        self.divideLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 45, 355, 1)];
        self.divideLabel2.backgroundColor = [UIColor lightGrayColor];
        self.divideLabel2.alpha = 0.8;
        [self addSubview:self.divideLabel2];
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 48, 355, 21)]
                ;
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        self.titleLabel.textColor = [UIColor darkGrayColor];
        [self addSubview:self.titleLabel];
        
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 69, 355, 42)];
        self.contentLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
        self.contentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:self.contentLabel];
        
        
        self.descriptionImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 110, 347, 90)];
        [self addSubview:self.descriptionImageView];
    } 
    return self;
} 

@end
