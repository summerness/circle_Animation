//
//  meViewController.m
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/7.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "meViewController.h"
#import "meTableViewCell.h"
#import "medetailViewController.h"

@interface meViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation meViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,Width , Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 1;
    }
    else if(section == 1){
        return 3;
    }
    else return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    //cell.textLabel.font = [UIFont systemFontOfSize:13];
    CGSize imageSize = CGSizeMake(20, 20);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, UIScreen.mainScreen.scale);
    CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (indexPath.section == 0) {
        meTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!Cell)
        {
            [tableView registerNib:[UINib nibWithNibName:@"meTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
            Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
            
        }
        return Cell;
    }
    else if(indexPath.section == 1){

        if (indexPath.row == 0) {
            cell.textLabel.text = @"我的用途";
            cell.detailTextLabel.text = @"备孕";
            cell.imageView.image = [UIImage imageNamed:@"order_selected"];
            return cell;
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"经期日期";
            cell.imageView.image = [UIImage imageNamed:@"order_selected"];
            return cell;
        }
        else {
            cell.textLabel.text = @"设置";
            cell.imageView.image = [UIImage imageNamed:@"order_selected"];
            return cell;
        }
    }
    else {
   
        cell.textLabel.text = @"反馈";
        cell.imageView.image = [UIImage imageNamed:@"order_selected"];

        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.section == 0)
       return 88;
   else return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            medetailViewController *medetail = [[medetailViewController alloc]init];
            [self.navigationController pushViewController:medetail animated:YES];
        }
    }

}



@end
