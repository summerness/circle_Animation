//
//  CircleShapeLayer.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleShapeLayer.h"

@interface CircleShapeLayer ()

@property (assign, nonatomic) double initialProgress;
@property (nonatomic, strong) CAShapeLayer *progressLayer;


@property (nonatomic, assign) CGRect frame;

@end

@implementation CircleShapeLayer

@synthesize percent = _percent;

- (instancetype)init {
    if ((self = [super init]))
    {
        [self setupLayer];
    }
    
    return self;
}

- (void)layoutSublayers {

    self.path = [self drawPathWithArcCenter];
    self.progressLayer.path = [self drawPathWithArcCenter];
    [super layoutSublayers];
}

- (void)setupLayer {
    
    self.path = [self drawPathWithArcCenter];
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = [UIColor colorWithRed:30/255.0 green:31/255.0 blue:52/255.0 alpha:1.0].CGColor;
    self.lineWidth = 8;//宽度
    
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.path = [self drawPathWithArcCenter];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.progressLayer.lineWidth = 8;//进度宽度
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineJoin = kCALineJoinRound;
   

}




- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat position_y = self.frame.size.height/2;
    CGFloat position_x = self.frame.size.width/2; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:position_y
                                      startAngle:(0)
                                        endAngle:(2*M_PI)
                                       clockwise:NO].CGPath;
}


- (void)setElapsed:(int)elapsed {
    _initialProgress = [self calculatePercent:_elapsed toNumber:_Limit];
    _elapsed = elapsed;
    self.progressLayer.strokeEnd = self.percent;
     [self addSublayer:self.progressLayer];
    [self startAnimation];
}

- (double)percent {
    
    _percent = [self calculatePercent:_elapsed toNumber:_Limit];
    return _percent;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.progressLayer.strokeColor = progressColor.CGColor;
}

- (double)calculatePercent:(int)fromNumber toNumber:(int)toNumber {
    
    if ((toNumber > 0) && (fromNumber > 0)) {
        
        CGFloat progress = 0;
        NSLog(@"fromNumber = %d,toNumber = %d", fromNumber,toNumber);
        
        progress = ((double)fromNumber) / toNumber;
        
        if ((progress * 100) > 100) {
            progress = 1.0f;
        }
        
        NSLog(@"Percent = %f", progress);
        
        return progress;
    }
    else
        return 0.0f;
}

- (void)startAnimation {
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @(self.initialProgress);
    pathAnimation.toValue = @(self.percent);
    pathAnimation.removedOnCompletion = YES;
    NSLog(@"%@__%@",pathAnimation.fromValue,pathAnimation.toValue);
    [self.progressLayer addAnimation:pathAnimation forKey:nil];
    
}

@end


