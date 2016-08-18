//
//  customNavigationController.m
//  宝蛋儿
//
//  Created by summer_ness on 16/8/12.
//  Copyright © 2016年 硕 王 . All rights reserved.
//

#import "customNavigationController.h"

@interface customNavigationController ()

@end

@implementation customNavigationController

#pragma mark - 重载父类进行改写
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //先进入子Controller
    [super pushViewController:viewController animated:animated];
    
    //替换掉leftBarButtonItem
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
    }
}

#pragma mark - 自定义返回按钮图片
-(UIBarButtonItem*)customLeftBackButton{
    
    UIImage *image = [UIImage imageNamed:@"back.png"];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.frame = CGRectMake(0, 0, 30, 30);
    
    [backButton setBackgroundImage:image
                          forState:UIControlStateNormal];
    
    [backButton addTarget:self
                   action:@selector(popself)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];    
    return backItem;
}

#pragma mark - 返回按钮事件(pop)
-(void)popself
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - 用图片设置导航背景
+ (void)initialize
{
    //取出设置主题的对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置导航栏的背景图片
    NSString *navBarBg = nil;
    
   
    navBar.tintColor = [UIColor whiteColor];

    
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:18]};
    
    
    //标题颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

@end
