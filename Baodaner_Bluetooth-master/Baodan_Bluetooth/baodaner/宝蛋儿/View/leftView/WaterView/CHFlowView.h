//
//  CHFlowView.h
//
//  baodaner
//
//  Created by summer_ness on 16/8/10.
//  Copyright © 2016年 summer_ness. All rights reserved.
//
#import <UIKit/UIKit.h>
@class CHFlowView;

@protocol CHFlowViewDelegate <NSObject>

- (void)pressedAtFlowView:(CHFlowView *)flowView;

@end

@interface CHFlowView : UIView

@property (nonatomic, assign) NSInteger index;

@property (nonatomic ,strong) UIImageView *imgv;

@property (nonatomic ,strong) UIImageView *centryimgv;

@property (nonatomic ,strong) UIImageView *centryimgv1;

@property (nonatomic ,strong) UIImageView *leftimgv;

@property (nonatomic ,strong) UIImageView *leftimgv1;

@property (nonatomic ,strong) UIImageView *leftimgv2;

@property (nonatomic ,strong) UILabel *centrylable;

@property (nonatomic ,strong) UILabel *rightlable;

@property (nonatomic ,strong) UILabel *midlable;

@property (nonatomic ,strong) UIImageView *lockview;

@property (nonatomic ,strong) UIImageView *lockview1;

@property (nonatomic ,strong) UIImageView *lockview2;

@property (nonatomic ,strong) UIImageView *imgv1;

@property (nonatomic ,strong) UIImageView *imgv2;

@property (nonatomic ,strong) UIButton *but1;

@property (nonatomic ,strong) UILabel *but1lable;

@property (nonatomic ,strong) UIButton *but2;

@property (nonatomic ,strong) UIView *shadowsview;

@property (nonatomic ,strong) UIView *shadowsview1;

@property (nonatomic ,strong) UIView *shadowsview2;

@property (nonatomic, strong) NSString *reuseIdentifier;

@property (nonatomic, assign) id <CHFlowViewDelegate> flowViewDelegate;

@end
