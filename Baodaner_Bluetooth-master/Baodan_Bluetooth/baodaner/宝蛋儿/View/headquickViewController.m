//
//  headquickViewController.m
//  宝蛋儿
//
//  Created by summer_ness on 16/8/12.
//  Copyright © 2016年 硕 王 . All rights reserved.
//

#import "headquickViewController.h"
#import "circleView.h"


@interface headquickViewController ()

@property (nonatomic , strong) circleView *cview;
@property (nonatomic , strong) UIButton *but;
@property (nonatomic , strong) UITapGestureRecognizer *tap ;
@end

@implementation headquickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"额头极速测量";
    self.view.backgroundColor = [UIColor colorWithRed:43/255.0 green:43/225.0 blue:68/255.0 alpha:1.0];
    int width0 = [[UIScreen mainScreen] bounds].size.width;
    float k = (float)width0/414;
    UIImageView *imgv = [[UIImageView alloc]init];
    imgv.frame = CGRectMake(self.view.frame.size.width/2-75*k-10, self.view.frame.size.height/5.5-10, 150*k+20, 150*k+20);
    imgv.image = [UIImage imageNamed:@"circle"];
    [self.view addSubview:imgv];
    UIColor *circlebackcorlor = [UIColor colorWithRed:59/255.0 green:165/255.0 blue:219/255.0 alpha:1.0];
    _cview = [[circleView alloc]initWithcirclewithframe:CGRectMake(self.view.frame.size.width/2-75*k, self.view.frame.size.height/5.5, 150*k, 150*k) withtext:@"点击测量" withlinewidth:8*k withcorlor:circlebackcorlor];
    _cview.label.textColor = [UIColor whiteColor];
    _cview.label.font = [UIFont systemFontOfSize:19*k];
    
    _cview.mur.text = @"MEASURE";
    _cview.mur.font = [UIFont systemFontOfSize:12*k];
    _cview.mur.textColor = [UIColor colorWithRed:143/255.0 green:143/255.0 blue:173/255.0 alpha:1.0];
    imgv.userInteractionEnabled = YES;
    
    
    [self.view addSubview:_cview];
    
    
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [imgv addGestureRecognizer:_tap];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2, self.view.frame.size.width-40, 44*k)];
    lable.text = @"监测过程需要5-8秒，请您耐心等待！";
    lable.font = [UIFont systemFontOfSize:15*k];
    lable.textColor = [UIColor colorWithRed:143/255.0 green:143/255.0 blue:173/255.0 alpha:1.0];
    [self.view addSubview:lable];
    
    
    UIView *lineview1 = [[UIView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2+44*k+5*k, self.view.frame.size.width-40, 1)];
    lineview1.backgroundColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:103/255.0 alpha:1.0];
    [self.view addSubview:lineview1];
    
    
    UIView *lineview2 = [[UIView alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2+44*k+5*k +  (self.view.frame.size.width-40)/2.4, self.view.frame.size.width-40, 1)];
    lineview2.backgroundColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:103/255.0 alpha:1.0];
    [self.view addSubview:lineview2];
    
    UILabel *temper = [[UILabel alloc]init];
    temper.frame = CGRectMake(20, self.view.frame.size.height/2+44*k+5*k+5, self.view.frame.size.width-40, (self.view.frame.size.width-40)/2.4-5);
    temper.text = @"00.0";
    temper.textColor = [UIColor colorWithRed:49/255.0 green:194/255.0 blue:124/255.0 alpha:1.0];
    temper.font = [UIFont systemFontOfSize:100];
    [self.view addSubview:temper];

    UIImageView *imav = [[UIImageView alloc]init];
    imav.frame = CGRectMake(temper.frame.size.width*5/6, temper.frame.size.height/5 , temper.frame.size.height/3, temper.frame.size.height/3);
    imav.image = [UIImage imageNamed:@"i_icon_55"];
    
    
    UILabel * tempinfo = [[UILabel alloc]init];
    tempinfo.frame = CGRectMake(0, temper.frame.size.height/5+temper.frame.size.height/3+15, self.view.frame.size.width-40, 15);
    [temper addSubview:tempinfo];
    tempinfo.textAlignment = NSTextAlignmentRight;
    tempinfo.textColor = [UIColor whiteColor];
    tempinfo.font = [UIFont systemFontOfSize:15];
    tempinfo.text = @"体温";
    
    
    UILabel * tempinfo1 = [[UILabel alloc]init];
    tempinfo1.frame = CGRectMake(0, temper.frame.size.height/5+temper.frame.size.height/3+15+20, self.view.frame.size.width-40, 15);
    [temper addSubview:tempinfo1];
    tempinfo1.textAlignment = NSTextAlignmentRight;
    tempinfo1.textColor = [UIColor colorWithRed:143/255.0 green:143/255.0 blue:173/255.0 alpha:1.0];
    tempinfo1.font = [UIFont systemFontOfSize:11];
    tempinfo1.text = @"单位：摄氏度℃";
    [temper addSubview:imav];
    
    
    _but = [[UIButton alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height-40*k-20, self.view.frame.size.width-40, 40*k)];
    
    [_but setTitle:@"开始测量" forState:UIControlStateNormal];
    [_but setTitleColor:[UIColor colorWithRed:143/255.0 green:143/255.0 blue:173/255.0 alpha:1.0] forState:UIControlStateNormal];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 49/255.0, 194/255.0, 124/255.0, 1 });
    _but.backgroundColor = [UIColor clearColor];
    [_but.layer setMasksToBounds:YES];
    [_but.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_but.layer setCornerRadius:20*k]; //设置矩圆角半径
    [_but.layer setBorderWidth:1.0];   //边框宽度
    [_but.layer setBorderColor:colorref];//边框颜色
    [self.view addSubview:_but];
    [_but addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
}

-(void)tap{
    [_cview start];
    dispatch_async(dispatch_get_main_queue(), ^{
        _but.enabled = NO;
        _tap.enabled = NO;
        _cview.label.text = @"测量中";
        _cview.mur.text = @"MEASURING";
        
    });
    [self performSelector:@selector(delay) withObject:@"Grand Central Dispatch" afterDelay:5.0];
    
}

-(void)delay{
    dispatch_async(dispatch_get_main_queue(), ^{
        _cview.label.text = @"测量完成";
        _cview.mur.text = @"MEASURE";
        _but.enabled = YES;
        _tap.enabled = YES;
        [_cview end];
    });
}



@end
