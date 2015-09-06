//
//  PALifeViewController.h
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PALifeTableViewCell.h"
#import "PALifeTableViewItem.h"
#import "PALifeDetailViewController.h"
@interface PALifeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
