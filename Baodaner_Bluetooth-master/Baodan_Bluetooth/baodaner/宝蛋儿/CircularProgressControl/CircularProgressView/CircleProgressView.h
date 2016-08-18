//
//  CircleProgressView.h
//  CircularProgressControl
//
//  Created by Carlos Eduardo Arantes Ferreira on 22/11/14.
//  Copyright (c) 2014 Mobistart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIControl

@property (nonatomic, assign) int elapsed;

@property (nonatomic, assign) int Limit;

@property (assign, nonatomic) double percent;

@property (strong, nonatomic) UILabel *progressLabel;

@property (strong, nonatomic) UILabel *logoLabel;

@property(strong, nonatomic) UIView *redview;

@end


