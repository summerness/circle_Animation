//
//  RightViewController.m
//  宝蛋儿
//
//  Created by 硕 王  on 16/8/10.
//  Copyright © 2016年 硕 王 . All rights reserved.
//


#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,400)];
    view.backgroundColor = [UIColor colorWithRed:58.0/255 green:193.0/255 blue:126.0/255 alpha:1];
    
    //隐藏NavigationBar上返回按钮的实现
    [self.navigationItem setHidesBackButton:YES];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
