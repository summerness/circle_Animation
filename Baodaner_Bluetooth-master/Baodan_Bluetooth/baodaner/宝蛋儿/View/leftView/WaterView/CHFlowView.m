//
//  CHFlowView.m
//  baodaner
//
//  Created by summer_ness on 16/8/10.
//  Copyright © 2016年 summer_ness. All rights reserved.
//
#import "CHFlowView.h"

@interface CHFlowView()
{
    
}
@end

@implementation CHFlowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = self.tag;
        
        btn.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
        btn.autoresizingMask = UIViewAutoresizingFlexibleWidth
        |UIViewAutoresizingFlexibleHeight;
   
        [btn addTarget:self action:@selector(pressed:) forControlEvents:UIControlEventTouchUpInside];
        
        _imgv  = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _imgv.autoresizingMask = UIViewAutoresizingFlexibleWidth
        |UIViewAutoresizingFlexibleHeight;
        
        [self addSubview:_imgv];
        
        _centryimgv = [[UIImageView alloc]init];
        
        _centryimgv.frame = CGRectMake(self.bounds.size.width/2-self.bounds.size.height/12, self.bounds.size.height/2-self.bounds.size.height/12, self.bounds.size.height/6, self.bounds.size.height/6);
        
        [self addSubview:_centryimgv];
        
        _centryimgv1 = [[UIImageView alloc]init];
        
        _centryimgv1.frame = CGRectMake(self.bounds.size.width/2-self.bounds.size.height/12, self.bounds.size.height/2-self.bounds.size.height/12, self.bounds.size.height/6, self.bounds.size.height/6);
        [self addSubview:_centryimgv1];
        
        _leftimgv = [[UIImageView alloc]init];
       
        _leftimgv.frame = CGRectMake(self.bounds.size.width/2-self.bounds.size.height/12, self.bounds.size.height/2-self.bounds.size.height/12, self.bounds.size.height/6, self.bounds.size.height/6);
        
        [self addSubview:_leftimgv];
        
        _leftimgv1 = [[UIImageView alloc]init];
        
        _leftimgv1.frame = CGRectMake(self.bounds.size.width/2-self.bounds.size.height/12, self.bounds.size.height/2-self.bounds.size.height/12, self.bounds.size.height/6, self.bounds.size.height/6);
        
        [self addSubview:_leftimgv1];
        
        _leftimgv2 = [[UIImageView alloc]init];
        
        _leftimgv2.frame = CGRectMake(self.bounds.size.width/2-self.bounds.size.height/12, self.bounds.size.height/2-self.bounds.size.height/12, self.bounds.size.height/6, self.bounds.size.height/6);
        
        [self addSubview:_leftimgv2];

        _centrylable = [[UILabel alloc]initWithFrame:self.bounds];
        
        [self addSubview:_centrylable];
        
        _centrylable.textAlignment = NSTextAlignmentCenter;
        
        _centrylable.textColor = [UIColor whiteColor];
        
        
        _rightlable = [[UILabel alloc]initWithFrame:self.bounds];
        
        [self addSubview:_rightlable];
        
        _rightlable.textAlignment = NSTextAlignmentRight;
        
        _rightlable.textColor = [UIColor whiteColor];
        
        [self addSubview:btn];
        
        _midlable = [[UILabel alloc]initWithFrame:self.bounds];
        
        [self addSubview:_midlable];
        
        _midlable.textAlignment = NSTextAlignmentCenter;
        
        _midlable.textColor = [UIColor whiteColor];
        
        [self addSubview:btn];

        _but1 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _but1.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
        _but1.backgroundColor = [UIColor colorWithRed:(CGFloat)59/255 green:(CGFloat)165/255 blue:(CGFloat)220/255 alpha:1];
        
        _but1.hidden = YES;
        
        _but2 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _but2.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
        _but1lable = [[UILabel alloc]initWithFrame:self.bounds];
        
        [self addSubview:_but1lable];
        
        _but1lable.textAlignment = NSTextAlignmentCenter;
        
        _but1lable.textColor = [UIColor whiteColor];
        
        [_but1 addSubview:_but1lable];
        
        _but2.backgroundColor = [UIColor colorWithRed:(CGFloat)35/255 green:(CGFloat)201/255 blue:(CGFloat)111/255 alpha:1];
        _but2.hidden = YES;
        
        [self addSubview:_but1];
        
        [self addSubview:_but2];

        _shadowsview = [[UIView alloc]initWithFrame:self.bounds];
        
        _shadowsview.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];
        
        _shadowsview.hidden = YES;
        
        [self addSubview:_shadowsview];
        
        _imgv1 = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _imgv2 = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [_but1 addSubview:_imgv1];
        
        [_but2 addSubview:_imgv2];

        _shadowsview1 = [[UIView alloc]initWithFrame:self.bounds];
        
        _shadowsview1.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];
        
        _shadowsview1.hidden = YES;
        
        [_but1 addSubview:_shadowsview1];
        
        _shadowsview2 = [[UIView alloc]initWithFrame:self.bounds];
        
        _shadowsview2.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.4];
        
        _shadowsview2.hidden = YES;
        
        [_but2 addSubview:_shadowsview2];
        
        _lockview = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _lockview.image = [UIImage imageNamed:@"lock"];
        
        [self addSubview:_lockview];
        
        _lockview.hidden = YES;
        
        _lockview1 = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _lockview1.image = [UIImage imageNamed:@"lock"];
        
        [_but1 addSubview:_lockview1];
        
        _lockview2.hidden = YES;
        
        _lockview2 = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _lockview2.image = [UIImage imageNamed:@"lock"];
        
        [_but2 addSubview:_lockview2];
        
        _lockview1.hidden = YES;
        
       

        return self;
    }
    return self;
}

- (void)pressed:(id)sender
{
    if (self) {
        if ([_flowViewDelegate respondsToSelector:@selector(pressedAtFlowView:)]) {
            
            [_flowViewDelegate pressedAtFlowView:self];
        }
    }
}




@end
