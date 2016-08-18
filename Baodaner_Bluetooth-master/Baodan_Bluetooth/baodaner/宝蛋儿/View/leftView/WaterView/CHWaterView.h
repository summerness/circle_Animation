//
//  PhoneWaterView.h
//
//  baodaner
//
//  Created by summer_ness on 16/8/10.
//  Copyright © 2016年 summer_ness. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "CHFlowView.h"

@interface CustomWaterInfo : NSObject

@property (nonatomic, assign)CGFloat topMargin;         //瀑布视图距离顶部高度
@property (nonatomic, assign)CGFloat bottomMargin;      //瀑布试图距离底部高度
@property (nonatomic, assign)CGFloat leftMargin;        //左边距
@property (nonatomic, assign)CGFloat rightMargin;       //右边距
@property (nonatomic, assign)CGFloat horizonPadding;    //水平间隔
@property (nonatomic, assign)CGFloat veticalPadding;    //垂直间隔
@property (nonatomic, assign)CGFloat numOfColumn;       //列数

@end

@class CHWaterView;

@protocol CHWaterViewDatasource <NSObject>
@required
//数量
- (NSInteger)numberOfFlowViewInWaterView:(CHWaterView *)waterView;

//瀑布流信息
- (CustomWaterInfo *)infoOfWaterView:(CHWaterView*)waterView;

//每个流
- (CHFlowView *)waterView:(CHWaterView *)waterView flowViewAtIndex:(NSInteger)index;

//每个流高度
- (CGFloat)waterView:(CHWaterView *)waterView heightOfFlowViewAtIndex:(NSInteger)index;
@end

@protocol CHWaterViewDelegate <NSObject>

@optional

//加载更多
- (void)needLoadMoreByWaterView:(CHWaterView *)waterView;

//滚动回调
- (void)phoneWaterViewDidScroll:(CHWaterView *)waterView;

//选中某个流
- (void)waterView:(CHWaterView *)waterView didSelectAtIndex:(NSInteger)index;

@end

@interface CHWaterView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, assign) BOOL isDataEnd;               //控制是否加载更多
@property (nonatomic, strong) UIView *bodyView;              //照片瀑布流视图
@property (nonatomic, weak) id<CHWaterViewDelegate> waterDelegate;
@property (nonatomic, weak) id<CHWaterViewDatasource> waterDataSource;
@property (nonatomic, strong) CustomWaterInfo *waterInfo;

/**
 *  初始化
 *
 *  @param frame 坐标
 *
 *  @return 瀑布流视图
 */
- (id)initWithFrame:(CGRect)frame;

/**
 *  重新加载
 */
- (void)reloadData;

/**
 *  重用cell
 *
 *  @param identifier cell标致
 *
 *  @return 可用的cell
 */
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier;

/**
 *  结束加载更多
 */
- (void)endLoadMore;

@end
