//
//  ddTabbarViewController.m
//  daidaixi
//
//  Created by summer on 15/7/21.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "ddTabbarViewController.h"
#import "SurveyViewController.h"
#import "calendarViewController.h"
#import "messageViewController.h"
#import "meViewController.h"

@interface ddTabbarViewController ()

@end

@implementation ddTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTabbar{
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"123.png"];
    CGRect frame = self.tabBar.bounds;
    UIView *v = [[UIView alloc] initWithFrame:frame];
    [v setBackgroundColor:[[UIColor alloc] initWithRed:255/255.0
                                                 green:255/255.0
                                                  blue:255/255.0
                                                 alpha:1]];
    [self.tabBar insertSubview:v atIndex:0];
    
}
-(void)setupAllChildViewControllers{
    // 1.测量
    SurveyViewController *survey = [[SurveyViewController alloc] init];
    [self setupChildViewController:survey title:@"测量" imageName:@"order_selected" selectedImageName:@"order_selected"];
    
    // 2.日历
    calendarViewController *calendar = [[calendarViewController alloc] init];
    [self setupChildViewController:calendar title:@"日历" imageName:@"order_selected" selectedImageName:@"order_selected"];
    
    // 3.消息
    messageViewController *message = [[messageViewController alloc] init];
    [self setupChildViewController:message title:@"消息" imageName:@"order_selected" selectedImageName:@"order_selected"];
    
    //
    meViewController *me = [[meViewController alloc] init];
    [self setupChildViewController:me title:@"我的" imageName:@"order_selected" selectedImageName:@"order_selected"];
   
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
   //[nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"123"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:28.0/255.0 green:145.0/255.0 blue:238.0/255.0 alpha:1.0]];
     [self addChildViewController:nav];
    
    UIColor * color = [UIColor whiteColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    nav.navigationBar.titleTextAttributes = dict;
    nav.navigationBar.tintColor = [UIColor whiteColor];
    
    // 3.添加tabbar内部的按钮
    //[self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

@end
