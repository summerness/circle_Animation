//
//  CircleShapeLayer.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CircleShapeLayer : CAShapeLayer

@property (nonatomic, assign) int elapsed;
@property (nonatomic, assign) int Limit;
@property (assign, nonatomic) double percent;
@property (nonatomic) UIColor *progressColor;

@end


