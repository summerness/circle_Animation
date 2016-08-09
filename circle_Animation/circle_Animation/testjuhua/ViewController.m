//
//  ViewController.m
//  testjuhua
//
//  Created by summer_ness on 16/8/8.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "ViewController.h"
#import "circleView.h"

@interface ViewController ()



@end

@implementation ViewController



- (void)viewDidLoad {
    
    circleView *cview = [[circleView alloc]initWithcirclewithframe:CGRectMake(10, 10, 200, 200) withtext:@"wwwwww" withlinewidth:5 withcorlor:[UIColor redColor]];

    [self.view addSubview:cview];
    
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"测量完毕";
//    label.frame = CGRectMake(self.view.frame.size.width/2 - 100, 50, 200, 200);
//    label.textAlignment = NSTextAlignmentCenter;
//    
//    [self.view addSubview:label];
//    
//    
//    CGPoint point = CGPointMake(label.frame.size.width/2, label.frame.size.width/2);
//    
//    //将贝塞尔曲线 调小一点点就好
//    UIBezierPath *p = [UIBezierPath bezierPathWithArcCenter:point radius:90.0f startAngle:.0f endAngle:M_PI clockwise:YES];
//    
//     UIBezierPath *p1 = [UIBezierPath bezierPathWithArcCenter:point radius:90.0f startAngle:.0f endAngle:M_PI*2 clockwise:YES];
//    
//    CAShapeLayer *backGroundLayer1 = [CAShapeLayer layer];
//    backGroundLayer1.fillColor = [UIColor clearColor].CGColor;
//    backGroundLayer1.strokeColor = [UIColor lightGrayColor].CGColor;
//    backGroundLayer1.lineCap = kCALineCapRound;
//    backGroundLayer1.lineJoin = kCALineJoinRound;
//    backGroundLayer1.path = p1.CGPath;
//    backGroundLayer1.lineWidth = 10;
//    backGroundLayer1.frame = label.bounds;
//    [label.layer addSublayer:backGroundLayer1];
//    
//    
//    CAGradientLayer *_gl = [CAGradientLayer layer];
//    _gl.frame = label.bounds;
//    CAShapeLayer *backGroundLayer = [CAShapeLayer layer];
//    backGroundLayer.fillColor = [UIColor clearColor].CGColor;
//    backGroundLayer.strokeColor = [UIColor redColor].CGColor;
//    backGroundLayer.lineCap = kCALineCapRound;
//    backGroundLayer.lineJoin = kCALineJoinRound;
//    backGroundLayer.path = p.CGPath;
//    backGroundLayer.lineWidth = 10;
//    backGroundLayer.frame = _gl.bounds;
//
//    _gl.startPoint = CGPointMake(.0f, .5f);
//    _gl.endPoint = CGPointMake(1.f, .5f);
//    _gl.mask = backGroundLayer;
//    
//    //做出渐变色
//    UIColor *ringColor = [UIColor orangeColor];
//    NSMutableArray *colors = [NSMutableArray new];
//    for(int i = 20; i >= 0; i-=2) {
//        [colors addObject:(__bridge id)[ringColor colorWithAlphaComponent:i*.1f].CGColor];
//    }
//    _gl.colors = colors;
//    
//    [label.layer addSublayer:_gl];
//    
//
//    
//    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    animate.byValue = @(M_PI*2);
//    animate.duration = 3;
//    animate.repeatCount = MAXFLOAT;  
//    [_gl addAnimation:animate forKey:@"animate"];

}



@end
