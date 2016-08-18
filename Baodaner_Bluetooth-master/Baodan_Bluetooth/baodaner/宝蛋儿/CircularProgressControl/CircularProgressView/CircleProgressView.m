//
//  CircleProgressView.m
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import "CircleProgressView.h"
#import "CircleShapeLayer.h"

@interface CircleProgressView()

@property (nonatomic, strong) UIView *view;

@property (nonatomic, strong) CircleShapeLayer *progressLayer;

@property (nonatomic, strong) CAShapeLayer *progressLayer1;

@end

@implementation CircleProgressView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupViews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.progressLayer.frame = self.bounds;
    
    [self.progressLabel sizeToFit];
    self.progressLabel.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y-25);
    
    _view.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y);
  //  [self.logoLabel sizeToFit];
    self.logoLabel.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y+15);
    _redview.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y- self.frame.origin.y+35);
    
}

- (void)updateConstraints {
    [super updateConstraints];
}

- (UILabel *)progressLabel
{
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _view = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x-self.bounds.size.width/8, self.bounds.origin.y, self.bounds.size.width/4, 1)];
        _view.backgroundColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:103/255.0 alpha:1.0];
        
        [self addSubview:_view];
        
        
        _redview = [[UIView alloc]initWithFrame:CGRectMake(self.bounds.origin.x-1, self.bounds.origin.y, 4, 4)];
        _redview.layer.cornerRadius = 2;
        _redview.backgroundColor = [UIColor redColor];
        [self addSubview:_redview];
        
        _progressLabel.numberOfLines = 2;
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.backgroundColor = [UIColor clearColor];
        _progressLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_progressLabel];
    }
    
    return _progressLabel;
}


- (UILabel *)logoLabel{
    if(!_logoLabel){
        _logoLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _logoLabel.numberOfLines = 1;
        _logoLabel.textAlignment = NSTextAlignmentCenter;
        _logoLabel.backgroundColor = [UIColor clearColor];
        _logoLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:_logoLabel];
    }
    
    return _logoLabel;

}



- (double)percent {
    return self.progressLayer.percent;
}

- (int)Limit {
    return self.progressLayer.Limit;
}

- (void)setLimit:(int)Limit {
    self.progressLayer.Limit = Limit;
}

- (void)setElapsed:(int)elapsed {
    _elapsed = elapsed;
    self.progressLayer.elapsed = elapsed;
    
}

#pragma mark - Private Methods

- (void)setupViews {
    
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = false;
    
    //add Progress layer
    self.progressLayer = [[CircleShapeLayer alloc] init];
    self.progressLayer.frame = self.bounds;
    self.progressLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [self.layer addSublayer:self.progressLayer];
    self.progressLayer1 = [CAShapeLayer layer];
    self.progressLayer1.path = [self drawPathWithArcCenter];
    self.progressLayer1.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer1.strokeColor = [UIColor colorWithRed:83/255.0 green:83/255.0 blue:103/255.0 alpha:1.0].CGColor;
    self.progressLayer1.lineWidth = 1;
    self.progressLayer1.lineCap = kCALineCapRound;
    self.progressLayer1.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:self.progressLayer1];
    
    
    
}



- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat position_y = self.frame.size.height/2;
    CGFloat position_x = self.frame.size.width/2; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:position_y*4.5/5
                                      startAngle:(-M_PI/2)
                                        endAngle:(3*M_PI/2)
                                       clockwise:YES].CGPath;
}


- (void)setTintColor:(UIColor *)tintColor {
    self.progressLayer.progressColor = tintColor;
   // self.progressLabel.textColor = tintColor;
}




@end


