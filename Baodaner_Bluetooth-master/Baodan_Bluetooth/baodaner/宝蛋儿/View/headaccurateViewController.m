//
//  headaccurateViewController.m
//  宝蛋儿
//
//  Created by summer_ness on 16/8/15.
//  Copyright © 2016年 硕 王 . All rights reserved.
//

#import "headaccurateViewController.h"
#import "CircleProgressView.h"



@interface headaccurateViewController (){
    int i;
}

@property (strong, nonatomic) CircleProgressView *circleProgressView;

@property (strong, nonatomic) NSTimer *countDownTimer;

@property (nonatomic , strong) UIButton *but;

@property (nonatomic , strong) UITapGestureRecognizer *tap ;

@end

@implementation headaccurateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"额头精准测量";
    self.view.backgroundColor = [UIColor colorWithRed:43/255.0 green:43/225.0 blue:68/255.0 alpha:1.0];
    int width0 = [[UIScreen mainScreen] bounds].size.width;
    float k = (float)width0/414;
    UIImageView *imgv = [[UIImageView alloc]init];
    imgv.frame = CGRectMake(self.view.frame.size.width/2-75*k-20, self.view.frame.size.height/5.5-20, 150*k+40, 150*k+40);
    imgv.image = [UIImage imageNamed:@"halfcircle"];
    [self.view addSubview:imgv];
    UIColor *circlebackcorlor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:103/255.0 alpha:1.0];
    
    
    _circleProgressView = [[CircleProgressView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75*k-10, self.view.frame.size.height/5.5-10, 150*k+20, 150*k+20)];
    _circleProgressView.Limit = 6;
   // _circleProgressView.elapsed = 6;
    UIColor *tintColor = [UIColor colorWithRed:59/255.0 green:165/255.0 blue:220/255.0 alpha:1.0];
    _circleProgressView.tintColor = tintColor;
    [self.view addSubview:_circleProgressView];
    _circleProgressView.progressLabel.font = [UIFont systemFontOfSize:19*k];
    _circleProgressView.logoLabel.font = [UIFont systemFontOfSize:12*k];
    _circleProgressView.logoLabel.textColor = [UIColor colorWithRed:108/255.0 green:105/255.0 blue:195/255.0 alpha:1.0];
    _circleProgressView.userInteractionEnabled = YES;
    _circleProgressView.progressLabel.text = @"请测量";
    _circleProgressView.logoLabel.text = @"MEASURE";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
    imgv.userInteractionEnabled = YES;
    
    
    [self.view addSubview:_circleProgressView];
    
    
    _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [imgv addGestureRecognizer:_tap];
    
    
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(20, self.view.frame.size.height/2, self.view.frame.size.width-40, 44*k)];
    lable.text = @"监测结果：";
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
    imav.image = [UIImage imageNamed:@"i_icon_56"];
    
    
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
    
    [_but setTitle:@"请测量" forState:UIControlStateNormal];
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

- (void)tap{
    i = 0;
    _circleProgressView.progressLabel.text = @"测量中";
    _circleProgressView.logoLabel.text = @"MEASURING";
    _but.enabled = NO;
    _tap.enabled = NO;
    
    //开始倒计时
    _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
}

-(void)timeFireMethod{
    dispatch_async(dispatch_get_main_queue(), ^{
        _circleProgressView.elapsed = i++;
        NSLog(@"_circleProgressView.elapsed %d",_circleProgressView.elapsed);
    });
    if(i == 7){
        [_countDownTimer invalidate];
        _circleProgressView.progressLabel.text = @"请测量";
        _circleProgressView.logoLabel.text = @"MEASURE";
        _tap.enabled = YES;
        _but.enabled = YES;
        
    }
}
@end
