//
//  guideViewController.m
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/7.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "guideViewController.h"
#import "ddTabbarViewController.h"

@interface guideViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong) UIScrollView *scrollView ;
@property(nonatomic, strong) UIPageControl *control;

@end

@implementation guideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initGuide];
}

- (void)initGuide
{
    _control = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 0)];
    _control.numberOfPages = 2;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.delegate = self;
    [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width*2, 0)];
    [_scrollView setPagingEnabled:YES];  //视图整页显示
    //    [scrollView setBounces:NO]; //避免弹跳效果,避免把根视图露出来
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [imageview setImage:[UIImage imageNamed:@"shou1_1.png"]];
    [_scrollView addSubview:imageview];
    
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [imageview1 setImage:[UIImage imageNamed:@"shou2_1.png"]];
    [_scrollView addSubview:imageview1];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.frame = CGRectMake(0, self.view.frame.size.height*8.5/10, self.view.frame.size.width,44);
    lable.text = @"点击开始";
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:22];
    lable.textAlignment = NSTextAlignmentCenter;
    [imageview1 addSubview:lable];
    imageview1.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(firstpressed)];
    [imageview1 addGestureRecognizer:singleTap1];
    [self.view addSubview:_scrollView];
    [self.view addSubview:_control];
    
}

-(void) firstpressed{
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.alpha = 0;
    } completion:^(BOOL finished) {
        
        [UIApplication sharedApplication].statusBarHidden = NO;
        // 切换窗口的根控制器
        self.view.window.rootViewController = [[ddTabbarViewController alloc] init];
        
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    NSInteger pageInt = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    
    
    _control.currentPage = pageInt;
    
}



@end
