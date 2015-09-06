//
//  PALifeViewController.m
//  PAWeather
//
//  Created by 史宁波 on 15/9/5.
//  Copyright (c) 2015年 pingan. All rights reserved.
//

#import "PALifeViewController.h"

@implementation PALifeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[PALifeTableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self initLifeViewHeader];
    [self initLifeViewFirstSection];
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:5];
    PALifeTableViewItem *item1 = [[PALifeTableViewItem alloc]init];
    [item1 setType:@"健康"];
    [item1 setTitle:@"如何安慰那些经历不幸的人"];
    [item1 setContent:@"假如有朋友经历了天津爆照的灾难，我们应该何如安慰他们呢"];
    [item1 setItemImageName:@"0.jpg"];
    
    PALifeTableViewItem *item2 = [[PALifeTableViewItem alloc]init];
    [item2 setType:@"美食"];
    [item2 setTitle:@"炒米线"];
    [item2 setContent:@"米线是真功夫里面的一款比较有特色的早餐，比较适合大众口味"];
    [item2 setItemImageName:@"1.jpg"];
    
    PALifeTableViewItem *item3 = [[PALifeTableViewItem alloc]init];
    [item3 setType:@"搭配"];
    [item3 setTitle:@"最是钟情帅牛仔"];
    [item3 setContent:@"全球十几亿人，穿着人数最多的上衣是什么？当然是简单百搭的T恤"];
    [item3 setItemImageName:@"2.jpg"];
    
    PALifeTableViewItem *item4 = [[PALifeTableViewItem alloc]init];
    [item4 setType:@"健康"];
    [item4 setTitle:@"如何才能消除爱情恐惧症？"];
    [item4 setContent:@"亲密可以让我们逃避自我，也可以让我们面对自我"];
    [item4 setItemImageName:@"3.jpg"];
    
    PALifeTableViewItem *item5 = [[PALifeTableViewItem alloc]init];
    [item5 setType:@"美食"];
    [item5 setTitle:@"虾酱炒秋葵"];
    [item5 setContent:@"昨天听豆亲说用马拉盏炒秋葵非常好吃，我家没有马拉魁，只有自己酿造的秋葵，味道还不错"];
    [item5 setItemImageName:@"4.jpg"];
    [items addObject:item1];
    [items addObject:item2];
    [items addObject:item3];
    [items addObject:item4];
    [items addObject:item5];
    
    PALifeTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    PALifeTableViewItem *item = [items objectAtIndex:indexPath.row];
    tableViewCell.typeLabel.text = item.type;
    tableViewCell.titleLabel.text = item.title;
    tableViewCell.contentLabel.text = item.content;
    tableViewCell.descriptionImageView.image = [UIImage imageNamed:item.itemImageName];
    return tableViewCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    PALifeDetailViewController *viewController = [[PALifeDetailViewController alloc]init];
//    [self.navigationController pushViewController:viewController animated:YES];
    
      [self performSegueWithIdentifier:@"LifeViewController" sender:self];
      [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


#pragma mark - Private

//初始化Life页面Header
- (void)initLifeViewHeader{
    
    //位置图片
    UIImageView *locationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 38, 15, 15)];
    [locationImageView setImage:[UIImage imageNamed:@"location"]];
    //位置标签
    UILabel *locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 35, 29, 21)];
    locationLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    locationLabel.text = @"深圳";
    //本地生活按钮
    UIButton *lifeButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 30, 75, 30)];
    [lifeButton setTitle:@"本地生活" forState:UIControlStateNormal];
    [lifeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //添加订阅按钮
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(315, 35, 60, 21)];
    [addButton setTitle:@"添加订阅" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.view addSubview:locationImageView];
    [self.view addSubview:locationLabel];
    [self.view addSubview:lifeButton];
    [self.view addSubview:addButton];
}

//初始化Life界面第一部分
- (void)initLifeViewFirstSection {

    UIButton *recommendButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, 375, 150)];
    [recommendButton setImage:[UIImage imageNamed:@"recommend"]forState:UIControlStateNormal];

    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 210, 26, 39)];
    dayLabel.text = @"13";
    UILabel *verticalLabel = [[UILabel alloc]initWithFrame:CGRectMake(26, 210, 6, 39)];
    verticalLabel.text = @"|";
    UILabel *monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 210, 340, 39)];
    monthLabel.text = @"8月";
    
    [self.view addSubview:recommendButton];
    [self.view addSubview:dayLabel];
    [self.view addSubview:verticalLabel];
    [self.view addSubview:monthLabel];
}

#pragma mark - Override

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"LifeViewController"]){
        UIViewController *lifeDetailViewController = segue.destinationViewController;
        [lifeDetailViewController setValue:@"从LifeViewController传递的数据" forKey:@"data"];
    }
}

@end
