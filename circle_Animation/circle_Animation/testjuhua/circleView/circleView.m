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
        
        UILabel *label = [[UILabel alloc] initWithFrame:labelframe];
        label.text = text ;
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        
        CGPoint point = CGPointMake(label.frame.size.width/2, label.frame.size.width/2);
        
        //将贝塞尔曲线 调小一点点就好
        UIBezierPath *p = [UIBezierPath bezierPathWithArcCenter:point radius:90.0f startAngle:-0.5*M_PI endAngle:0.5*M_PI clockwise:YES];
        
        UIBezierPath *p1 = [UIBezierPath bezierPathWithArcCenter:point radius:90.0f startAngle:.0f endAngle:M_PI*2 clockwise:YES];
        
        CAShapeLayer *backGroundLayer1 = [CAShapeLayer layer];
        backGroundLayer1.fillColor = [UIColor clearColor].CGColor;
        backGroundLayer1.strokeColor = [UIColor lightGrayColor].CGColor;
        backGroundLayer1.lineCap = kCALineCapRound;
        backGroundLayer1.lineJoin = kCALineJoinRound;
        backGroundLayer1.path = p1.CGPath;
        backGroundLayer1.lineWidth = width;
        backGroundLayer1.frame = label.bounds;
        [label.layer addSublayer:backGroundLayer1];
        _gl = [CAGradientLayer layer];
        _gl.frame = label.bounds;
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
        
        [label.layer addSublayer:_gl];
            }
    return self;
}

-(void)start{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animate.byValue = @(M_PI*2);
    animate.duration = 3;
    animate.repeatCount = MAXFLOAT;
    [_gl addAnimation:animate forKey:@"animate"];

}

- (void)end{
    [_gl removeAllAnimations ];
    
}




@end
