//
//  DVPlot.m
//  DVLineChart
//
//   All rights reserved.
//

#import "DVPlot.h"

@implementation DVPlot

- (instancetype)init {
    
    if (self = [super init]) {
        self.lineColor = [UIColor blackColor];
        self.pointColor = [UIColor blackColor];
        self.pointSelectedColor = [UIColor orangeColor];
    }
    return self;
}

@end
