//
//  ColpusViewController.m
//  宝蛋儿
//
//  Created by 硕 王  on 16/8/15.
//  Copyright © 2016年 硕 王 . All rights reserved.
//

#import "ColpusViewController.h"
#import "LBCircleView.h"
#import "DVLineChartView.h"
#import "DVPlot.h"
#import "UIView+Extension.h"
#import "UIColor+Hex.h"
@interface ColpusViewController ()

@end

@implementation ColpusViewController
{
    LBCircleView *circleView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:43.0/255 green:44.0/255 blue:67.0/255 alpha:1];
    self.title = @"胸前连续测温";
    
    DVLineChartView *ccc = [[DVLineChartView alloc] init];
    [self.view addSubview:ccc];
    
    ccc.width = self.view.width;
    
    ccc.yAxisViewWidth = 30;
    
    ccc.numberOfYAxisElements = 9;
    
    ccc.delegate = self;
    ccc.pointUserInteractionEnabled = YES;
    
    ccc.yAxisMaxValue = 41.0;
    
    ccc.pointGap = 50;
    
    ccc.showSeparate = YES;
    ccc.separateColor = [UIColor colorWithHexString:@"67707c"];
    
    ccc.textColor = [UIColor colorWithHexString:@"9aafc1"];
    ccc.backColor = [UIColor colorWithHexString:@"3e4a59"];
    ccc.axisColor = [UIColor colorWithHexString:@"67707c"];
    
    ccc.xAxisTitleArray = @[@"4.1", @"4.2", @"4.3", @"4.4", @"4.5", @"4.6", @"4.7", @"4.8", @"4.9", @"4.10", @"4.11", @"4.12", @"4.13", @"4.14", @"4.15", @"4.16", @"4.17", @"4.18", @"4.19", @"4.20", @"4.21", @"4.22", @"4.23", @"4.24", @"4.25", @"4.26", @"4.27", @"4.28", @"4.29", @"4.30"];
    
    
    ccc.x = 0;
    ccc.y = 250;
    ccc.width = self.view.width;
    ccc.height = 250;
    
    
    
    DVPlot *plot = [[DVPlot alloc] init];
    plot.pointArray = @[@300, @550, @700, @200, @370, @890, @760, @430, @210, @30, @300, @550, @700, @200, @370, @890, @760, @430, @210, @30, @300, @550, @700, @200, @370, @890, @760, @430, @210, @30];
    
    
    
    
    plot.lineColor = [UIColor colorWithHexString:@"2f7184"];
    plot.pointColor = [UIColor colorWithHexString:@"14b9d6"];
    plot.chartViewFill = YES;
    plot.withPoint = YES;
    
    
    [ccc addPlot:plot];
    [ccc draw];
    [self createUI];
    
    
    
    circleView = [[LBCircleView alloc] initWithFrame:CGRectMake(0, 70, 180, 200)];
    // circleView.center = self.view.center;
    //  circleView.backgroundColor = [UIColor colorWithRed:255.0/255 green:157.0/255 blue:182.0/255 alpha:1.0];
    [self.view addSubview:circleView];
    circleView.percentColor = [UIColor colorWithRed:76.0/255 green:15.0/255 blue:77.0/255 alpha:1.0];
    
    [circleView setProgress:0.5 animated:YES];
}

-(void)createUI
{
    
    UILabel * rangeLable = [[UILabel alloc] init];
    rangeLable.frame = CGRectMake(240, 80, 80, 50);
    rangeLable.text = @"温度范围设置";
    rangeLable.textColor = [UIColor whiteColor];
    rangeLable.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:rangeLable];
    
    
    UILabel * lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(260, 160, 50, 50);
    lable.text = @"体温";
    lable.textColor = [UIColor whiteColor];
    lable.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:lable];
    
    UILabel * temLable = [[UILabel alloc] init];
    temLable.frame = CGRectMake(230, 180, 80, 50);
    temLable.text = @"单位: 摄氏度C";
    temLable.textColor = [UIColor whiteColor];
    temLable.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:temLable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
