//
//  circleView.m
//  testjuhua
//
//  Created by summer_ness on 16/8/8.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "circleView.h"
@interface circleView()

@property (nonatomic , strong) CAGradientLayer *gl;


@end


@implementation circleView

- (id)initWithcirclewithframe:(CGRect)labelframe withtext:(NSString *)text withlinewidth:(int)width withcorlor:(UIColor *)corlor{
    self = [super init];
    
    if(self){
        
        _label = [[UILabel alloc] initWithFrame:labelframe];
        _label.text = text ;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.userInteractionEnabled = YES;
        [self addSubview:_label];
        
        _mur = [[UILabel alloc]init];
        _mur.textAlignment = NSTextAlignmentCenter;
        _mur.frame = CGRectMake(0, _label.bounds.size.height*2/7, _label.bounds.size.width, 10);
        [_label addSubview:_mur];
        
        
        CGPoint point = CGPointMake(_label.frame.size.width/2, _label.frame.size.width/2);
        
        //将贝塞尔曲线 调小一点点就好
        UIBezierPath *p = [UIBezierPath bezierPathWithArcCenter:point radius:_label.frame.size.width/2.0f-5 startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
        
        UIBezierPath *p1 = [UIBezierPath bezierPathWithArcCenter:point radius:_label.frame.size.width/2.0f-5 startAngle:.0f endAngle:M_PI*2 clockwise:YES];
        
        CAShapeLayer *backGroundLayer1 = [CAShapeLayer layer];
        backGroundLayer1.fillColor = [UIColor clearColor].CGColor;
        backGroundLayer1.strokeColor = [UIColor colorWithRed:65/255.0 green:65/255.0 blue:87/255.0 alpha:1.0].CGColor;
        backGroundLayer1.lineCap = kCALineCapRound;
        backGroundLayer1.lineJoin = kCALineJoinRound;
        backGroundLayer1.path = p1.CGPath;
        backGroundLayer1.lineWidth = width;
        backGroundLayer1.frame = _label.bounds;
        [_label.layer addSublayer:backGroundLayer1];
        _gl = [CAGradientLayer layer];
        _gl.frame = _label.bounds;
        CAShapeLayer *backGroundLayer = [CAShapeLayer layer];
        backGroundLayer.fillColor = [UIColor clearColor].CGColor;
        backGroundLayer.strokeColor = [UIColor redColor].CGColor;
        backGroundLayer.lineCap = kCALineCapSquare;
        backGroundLayer.lineJoin = kCALineCapSquare;
        backGroundLayer.path = p.CGPath;
        backGroundLayer.lineWidth = width;
        backGroundLayer.frame = _gl.bounds;
        
        _gl.startPoint = CGPointMake(.5f, 1.f);
        _gl.endPoint = CGPointMake(1.f, .1f);
        _gl.mask = backGroundLayer;
        
        //做出渐变色
        UIColor *ringColor = corlor;
        NSMutableArray *colors = [NSMutableArray new];
        for(int i = 20; i >= 0; i-=2) {
            [colors addObject:(__bridge id)[ringColor colorWithAlphaComponent:i*.1f].CGColor];
        }
        _gl.colors = colors;
        
        [_label.layer addSublayer:_gl];
            }
    return self;
}

-(void)start{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animate.byValue = @(M_PI*2);
    animate.duration = 1;
    animate.repeatCount = MAXFLOAT;
    [_gl addAnimation:animate forKey:@"animate"];

}

- (void)end{
    [_gl removeAllAnimations ];
    
}




@end
