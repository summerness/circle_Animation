//
//  mainViewController.m
//  baodaner
//
//  Created by summer_ness on 16/8/10.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "mainViewController.h"
#import "CHFlowView.h"
#import "CHWaterView.h"
#import "iconData.h"

@interface mainViewController ()<CHWaterViewDatasource,CHWaterViewDelegate>

@property (nonatomic , strong) CHWaterView *waterView;

@property (nonatomic , strong) CHWaterView *waterViewfoot;

@property (nonatomic , strong) NSMutableArray *testDataArr;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _waterView = [[CHWaterView alloc]  initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _waterView.waterDataSource = self;
    _waterView.waterDelegate = self;
    _waterView.isDataEnd = YES;
    _waterView.backgroundColor = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    
    [self.view addSubview:_waterView];
    [self setupdataArr];
    
    [_waterView reloadData];
}

-(void)setupdataArr{
    NSLog(@"%-f",self.view.frame.size.height);
    int height00 = [UIScreen mainScreen].bounds.size.height;
    int heights[11] =  {152,152,182,119,151,88,88,88,138,138};
    UIColor *corlor1 = [UIColor colorWithRed:(CGFloat)59/255 green:(CGFloat)165/255 blue:(CGFloat)220/255 alpha:1];
    UIColor *corlor2 = [UIColor colorWithRed:(CGFloat)35/255 green:(CGFloat)201/255 blue:(CGFloat)111/255 alpha:1];
    UIColor *corlor3 = [UIColor colorWithRed:(CGFloat)49/255 green:(CGFloat)194/255 blue:(CGFloat)124/255 alpha:1];
    UIColor *corlor4 = [UIColor colorWithRed:(CGFloat)234/255 green:(CGFloat)82/255 blue:(CGFloat)41/255 alpha:1];
    UIColor *corlor5 = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    UIColor *corlor6 = [UIColor colorWithRed:(CGFloat)59/255 green:(CGFloat)165/255 blue:(CGFloat)220/255 alpha:1];
    UIColor *corlor7 = [UIColor colorWithRed:(CGFloat)234/255 green:(CGFloat)82/255 blue:(CGFloat)41/255 alpha:1];
    UIColor *corlor8 = [UIColor colorWithRed:(CGFloat)35/255 green:(CGFloat)201/255 blue:(CGFloat)111/255 alpha:1];
    UIColor *corlor9 = [UIColor colorWithRed:(CGFloat)254/255 green:(CGFloat)92/255 blue:(CGFloat)34/255 alpha:1];
    UIColor *corlor10 = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    NSArray *corlors = [NSArray arrayWithObjects:corlor1,corlor2,corlor3,corlor4,corlor5,corlor6,corlor7,corlor8,corlor9,corlor10, nil];
    _testDataArr = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        iconData *data = [[iconData alloc] init];
        data.height = heights[i]*height00/760;
        data.color = corlors[i];
        [_testDataArr addObject:data];
    }
}


#pragma mark - CHWaterViewDatasource
- (NSInteger)numberOfFlowViewInWaterView:(CHWaterView *)waterView
{
    return [_testDataArr count];
}

- (CustomWaterInfo *)infoOfWaterView:(CHWaterView*)waterView
{
        CustomWaterInfo *info = [[CustomWaterInfo alloc] init];
        info.topMargin = 8;
        info.leftMargin = 6;
        info.bottomMargin = 0;
        info.rightMargin = 6;
        info.horizonPadding = 6;
        info.veticalPadding = 6;
        info.numOfColumn = 2;
        return info;
}

- (CHFlowView *)waterView:(CHWaterView *)waterView flowViewAtIndex:(NSInteger)index
{
    iconData *data = [_testDataArr objectAtIndex:index];
    CHFlowView *flowView = [waterView dequeueReusableCellWithIdentifier:@"cell"];
    if (flowView == nil) {
        flowView = [[CHFlowView alloc] initWithFrame:CGRectZero];
        flowView.reuseIdentifier = @"cell";
    }
    int width0 = [[UIScreen mainScreen] bounds].size.width;
    

    flowView.index = index;
    flowView.backgroundColor = data.color;
    float k = (float)width0/414;
   // NSLog(@"%f-----%d",k,width0);
    
    NSLog(@"%f-----%d",flowView.frame.size.height , flowView.index);
    
    if(flowView.index == 0){
        flowView.centryimgv.image = [UIImage imageNamed:@"i_icon_46"];
        flowView.centrylable.text =  @"额头极速测量";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];
         return flowView;
    }
    else if(flowView.index == 1){
        
        flowView.leftimgv.image = [UIImage imageNamed:@"i_icon_47"];
        flowView.rightlable.text =  @"额头精准测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
    }
    else if(flowView.index == 2){

        
        flowView.centryimgv.image = [UIImage imageNamed:@"i_icon_48"];
        flowView.centrylable.text =  @"胸前连续测量";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];

        return flowView;
    }
    else if(flowView.index == 3){

        
        flowView.leftimgv1.image = [UIImage imageNamed:@"i_icon_49"];
        flowView.rightlable.text =  @"拇指心率测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
    }
    else if(flowView.index == 4){
        flowView.imgv.image = [UIImage imageNamed:@"baby_1.jpg"];
        return flowView;
    }
    
    else if(flowView.index == 5){
        flowView.midlable.text =  @"奶水极速测量";
        flowView.shadowsview.hidden = NO;
         flowView.lockview.hidden = NO;
        flowView.midlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;

    }
    
    else if(flowView.index == 6){
        flowView.midlable.text =  @"中医远程问诊";
        flowView.midlable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
         flowView.lockview.hidden = NO;
        return flowView;
    }
    
    else if(flowView.index == 7){
        flowView.leftimgv2.image = [UIImage imageNamed:@"i_icon_50"];
        flowView.rightlable.text =  @"精准血压测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
        flowView.lockview.hidden = NO;
        return flowView;

    }
    else if(flowView.index == 8){

        flowView.centryimgv1.image = [UIImage imageNamed:@"i_icon_51"];
        flowView.centrylable.text =  @"婴儿啼哭识别";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
         flowView.lockview.hidden = NO;
        return flowView;
    }
    else if (flowView.index == 9){
        flowView.but1.hidden = NO;
        flowView.but2.hidden = NO;
        flowView.shadowsview1.hidden = NO;
        flowView.shadowsview2.hidden = NO;
        flowView.lockview1.hidden = NO;
        flowView.lockview2.hidden = NO;
        
        return flowView;
    }
    else return nil;
}

- (CGFloat)waterView:(CHWaterView *)waterView heightOfFlowViewAtIndex:(NSInteger)index
{
    iconData *data = [_testDataArr objectAtIndex:index];
    return data.height;
}


#pragma mark - CHWaterViewDelegate


- (void)phoneWaterViewDidScroll:(CHWaterView *)waterView
{
    //do what you want to do
    return;
}

- (void)waterView:(CHWaterView *)waterView didSelectAtIndex:(NSInteger)index
{
    NSLog(@"didSelectAtIndex%d",index);
}



@end
