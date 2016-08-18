//
//  circleView.h
//  testjuhua
//
//  Created by summer_ness on 16/8/8.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface circleView : UIView



- (id)initWithcirclewithframe:(CGRect)labelframe withtext:(NSString *)text withlinewidth:(int)width withcorlor:(UIColor *)corlor;


-(void)start;

-(void)end;

-(void)pause;


@end
