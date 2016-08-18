//
//  PhoneWaterView.m
//  
//
//  baodaner
//
//  Created by summer_ness on 16/8/10.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "CHWaterView.h"
#include <vector>
using namespace std;

#define UI_SCREEN_HEIGHT            ([[UIScreen mainScreen] bounds].size.height)
#define UI_SCREEN_WIDTH             ([[UIScreen mainScreen] bounds].size.width)
#define BottomLineHeight            (self.contentOffset.y-self.waterInfo.topMargin+self.frame.size.height)
#define TopLineHeight               (self.contentOffset.y-self.waterInfo.topMargin)

@interface TopEntity : NSObject

@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) NSInteger index;

@end

@implementation TopEntity

@end


@implementation CustomWaterInfo

@end

@interface CHWaterView()<CHFlowViewDelegate>
{
    UIView *_footView;                              //加载更多视图
    NSMutableArray *_visibleViews;                  //可见视图
    vector<CGPoint> _bottomDrawPointVector;         //底部绘制点
    vector<TopEntity *> _topEntityVector;           //上部绘制点
    vector<CGPoint *> _simulatePointVector;         //模拟绘制指针
	NSMutableDictionary *_reusedViews;              //可重用视图
    NSMutableDictionary *_resHeightDic;             //绘制视图高度
    NSRange _topRange;                              //上部范围
    NSRange _visibleRange;                          //可见范围
    CGFloat _resWidth;                              //视图宽度
}

@property (nonatomic , assign) CGRect rect;
@end

@implementation CHWaterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
        self.isDataEnd = YES;
        _rect = frame;
    }
    return self;
}

- (void)dealloc
{
    [self clearVector];
}

#pragma mark - Inside
- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    if (!identifier || identifier == 0 ) return nil;
    
    NSArray *cellsWithIndentifier = [NSArray arrayWithArray:[_reusedViews objectForKey:identifier]];
    if (cellsWithIndentifier &&  cellsWithIndentifier.count > 0)
    {
        CHFlowView *flowView = [cellsWithIndentifier lastObject];
        [[_reusedViews objectForKey:identifier] removeLastObject];
        return flowView;
    }
    return nil;
}

/**
 *  放视图到重用队列
 *
 *  @param flowView 视图
 */
- (void)recycleFlowViewIntoReusableQueue:(CHFlowView *)flowView
{
    if (!flowView.reuseIdentifier) {
        return;
    }
    if(!_reusedViews)
    {
        _reusedViews = [NSMutableDictionary dictionary];
        
        NSMutableArray *array = [NSMutableArray arrayWithObject:flowView];
        [_reusedViews setObject:array forKey:flowView.reuseIdentifier];
    }
    
    else
    {
        if (![_reusedViews objectForKey:flowView.reuseIdentifier])
        {
            NSMutableArray *array = [NSMutableArray arrayWithObject:flowView];
            [_reusedViews setObject:array forKey:flowView.reuseIdentifier];
        }
        else
        {
            [[_reusedViews objectForKey:flowView.reuseIdentifier] addObject:flowView];
        }
    }
}

/**
 *  视图移动
 *
 *  @param scrollView 视图
 */
- (void)waterScroll:(UIScrollView *)scrollView
{
    //顶部视图移出
    if (_visibleRange.length > 0) {
        CGPoint topOutPoint = (_bottomDrawPointVector[_visibleRange.location]);
        CGFloat topOutHeight = (topOutPoint).y+[[_resHeightDic objectForKey:[NSNumber numberWithInt:_visibleRange.location]] floatValue];
        if (topOutHeight < TopLineHeight) {
            CHFlowView *flowView = [_visibleViews firstObject];
            [self recycleFlowViewIntoReusableQueue:flowView];
            [flowView removeFromSuperview];
            [_visibleViews removeObject:flowView];
            _visibleRange.location++;
            _visibleRange.length--;
            _topRange.length--;
            return;
        }
    }
    
    //顶部视图移入
    if (_visibleRange.location >= 1) {
        //当前应移入坐标
        TopEntity *topEntity = _topEntityVector[_topRange.location+_topRange.length];
        if (topEntity.point.y>TopLineHeight) {//循环添加到移入点
            while (_visibleRange.location>= topEntity.index+1) {//be caution location is a non-negtive
                CGPoint topInPoint = _bottomDrawPointVector[_visibleRange.location-1];
                UIView *view = [self drawView:topInPoint index:_visibleRange.location-1];
                [_visibleViews insertObject:view atIndex:0];
                _visibleRange.location--;
                _visibleRange.length++;
                _topRange.length++;
            }
            return;
        }
    }
    
    //底部视图移入
    if (_visibleRange.location+_visibleRange.length <= _bottomDrawPointVector.size()-1) {
        CGPoint bottomInPoint = _bottomDrawPointVector[_visibleRange.location+_visibleRange.length];
        CGFloat bottomInHeight = (bottomInPoint).y;
        if (bottomInHeight<BottomLineHeight) {
            UIView *view = [self drawView:bottomInPoint index:_visibleRange.location+_visibleRange.length];
            [_visibleViews addObject:view];
            _visibleRange.length++;
            return;
        }
    }
    //底部视图移出
    if ((_visibleRange.location+_visibleRange.length <= _bottomDrawPointVector.size())
        &&_visibleRange.length>=1) {
        CGPoint bottomOutPoint = _bottomDrawPointVector[_visibleRange.location+_visibleRange.length-1];
        CGFloat bottomOutHeight = (bottomOutPoint).y;
        if (bottomOutHeight>BottomLineHeight) {
            CHFlowView *flowView = [_visibleViews lastObject];
            [self recycleFlowViewIntoReusableQueue:flowView];
            [flowView removeFromSuperview];
            [_visibleViews removeObject:flowView];
            _visibleRange.length--;
            return;
        }
    }
    

  
}

/**
 *  通知代理加载更多
 */
- (void)loadMore
{
    if ([self.waterDelegate respondsToSelector:@selector(needLoadMoreByWaterView:)]) {
        [_waterDelegate needLoadMoreByWaterView:self];
    }
}

/**
 *  绘制视图节点
 *
 *  @param resArr 视图数组
 */
- (UIView *)drawView:(CGPoint)drawPoint index:(int)index
{
    CGRect flowViewRect;
    int width0 = _rect.size.width;
    int height0 = _rect.size.height;
    
    float i = (float)width0/414;
    
    float k = (float)width0 * 0.08 ;
    if((width0 == 320) && (height0 == 568)){
        if(index <4){
            if(index%2 == 0){
                flowViewRect.origin = drawPoint;
                flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
            else if(index%2 == 1){
                flowViewRect.origin.y = drawPoint.y;
                flowViewRect.origin.x = drawPoint.x -k;
                flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
        }
        else if(index == 4) {
            //            if(index%2 == 1){
            //                    flowViewRect.origin = drawPoint;
            //                    flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            //            }
            //            else if(index%2 == 0){
            flowViewRect.origin.y = drawPoint.y;
            flowViewRect.origin.x = drawPoint.x -k;
            flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
        }
        else if(index == 5){
            flowViewRect.origin = drawPoint;
            flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
        }
        
        else {
            if(index%2 == 0){
                flowViewRect.origin = drawPoint;
                flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
            else if(index%2 == 1){
                flowViewRect.origin.y = drawPoint.y;
                flowViewRect.origin.x = drawPoint.x -k;
                flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
        }
        

    }
    else{
        if(index <4){
            if(index%2 == 0){
                flowViewRect.origin = drawPoint;
                flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
            else if(index%2 == 1){
                flowViewRect.origin.y = drawPoint.y;
                flowViewRect.origin.x = drawPoint.x -k;
                flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
        }
        else if(index > 5){
            if(index%2 == 0){
                flowViewRect.origin = drawPoint;
                flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
            else if(index%2 == 1){
                flowViewRect.origin.y = drawPoint.y;
                flowViewRect.origin.x = drawPoint.x -k;
                flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
        }
        else{
            if(index%2 == 1){
                flowViewRect.origin = drawPoint;
                flowViewRect.size = CGSizeMake(_resWidth-k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
            else if(index%2 == 0){
                flowViewRect.origin.y = drawPoint.y;
                flowViewRect.origin.x = drawPoint.x -k;
                flowViewRect.size = CGSizeMake(_resWidth+k, [[_resHeightDic objectForKey:[NSNumber numberWithInt:index]] floatValue]);
            }
        }
    }
    CHFlowView *view = [self.waterDataSource waterView:self flowViewAtIndex:index];
    view.flowViewDelegate = self;
    view.frame = flowViewRect;
    
    view.centryimgv.frame = CGRectMake(flowViewRect.size.width/2-flowViewRect.size.height/6, flowViewRect.size.height/2-flowViewRect.size.height/4, flowViewRect.size.height/3, flowViewRect.size.height/3);
    
    view.centryimgv1.frame = CGRectMake(flowViewRect.size.width/2-flowViewRect.size.height/4*1.16, flowViewRect.size.height/2-flowViewRect.size.height/3, flowViewRect.size.height/2*1.16, flowViewRect.size.height/2);
    
    
    view.leftimgv.frame = CGRectMake(flowViewRect.size.width/2-flowViewRect.size.height/1.5, flowViewRect.size.height/2-flowViewRect.size.height/4, flowViewRect.size.height/3, flowViewRect.size.height/3);
    
    view.leftimgv1.frame = CGRectMake(flowViewRect.size.width/2-flowViewRect.size.height/1.5*1.248, flowViewRect.size.height/2-flowViewRect.size.height/4, flowViewRect.size.height/3*1.248, flowViewRect.size.height/3);
    
    view.leftimgv2.frame = CGRectMake( (flowViewRect.size.width/2-flowViewRect.size.height/4*1.248)/3, flowViewRect.size.height/2-flowViewRect.size.height/3, flowViewRect.size.height/2*1.138, flowViewRect.size.height/2);
    
    view.centrylable.frame = CGRectMake(0, flowViewRect.size.height-44*i, flowViewRect.size.width, 44);
    
    view.rightlable.frame = CGRectMake(0, flowViewRect.size.height-44*i, flowViewRect.size.width-44*i, 44);
    
    view.midlable.frame = CGRectMake(0, flowViewRect.size.height/2-22, flowViewRect.size.width, 44);
    
    view.but1.frame = CGRectMake(0, 0, flowViewRect.size.height, flowViewRect.size.height);
    
    view.lockview.frame = CGRectMake(flowViewRect.size.width/2 - 40, flowViewRect.size.height/2 - 40, 80, 80);
    
    
    view.imgv1.frame =CGRectMake(view.but1.bounds.size.width/2 - view.but1.bounds.size.height/6*0.75, view.but1.bounds.size.height/3*0.75, view.but1.bounds.size.height/3*0.75, view.but1.bounds.size.height/3);
    
    view.imgv1.image = [UIImage imageNamed:@"i_icon_52"];
    
    view.lockview1.frame = CGRectMake(view.but1.bounds.size.width/2 - 40, view.but1.bounds.size.height/2 - 40, 80, 80);
    
    view.shadowsview1.frame = view.but1.bounds;
    
    view.but1lable.frame = CGRectMake(0, view.but1.bounds.size.height-44*i, view.but1.bounds.size.width, 44);
    
    view.but1lable.text = @"蓝牙连接";
 
    view.but2.frame = CGRectMake( flowViewRect.size.height + 6,0, flowViewRect.size.width - flowViewRect.size.height -6, flowViewRect.size.height);
    
    view.imgv2.frame = CGRectMake(view.but2.bounds.size.width/2 - view.but2.bounds.size.width/30*4.678, view.but2.bounds.size.height/2, view.but2.bounds.size.width/15*4.678, view.but2.bounds.size.width/15);
    
    view.lockview2.frame = CGRectMake(view.but2.bounds.size.width/2 - 40, view.but2.bounds.size.height/2 - 40, 80, 80);
    
    view.shadowsview2.frame = view.but2.bounds;

    view.imgv2.image = [UIImage imageNamed:@"i_icon_53"];
    
    view.shadowsview.frame = CGRectMake(0, 0, flowViewRect.size.width, flowViewRect.size.height);
    
    
    
    
    
    
    [_bodyView addSubview:view];
    
    
    
    return view;
}

/**
 *  初始化视图
 */
- (void)initView
{
    _bodyView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.waterInfo.topMargin, self.frame.size.width, self.contentSize.height-self.waterInfo.topMargin)];
    _bodyView.backgroundColor = [UIColor clearColor];
    [self addSubview:_bodyView];
    
    BOOL isFirst = YES;
    for (int i=0; i<_bottomDrawPointVector.size(); i++) {
        CGPoint point = _bottomDrawPointVector[i];
        
        int width0 = _rect.size.width;
        int height0 = _rect.size.height;
        if((width0 == 320) && (height0 == 568)){
            
            if(i == 6){
                 point = _bottomDrawPointVector[7];
            }
            else if(i == 7){
                 point = _bottomDrawPointVector[6];
            }
            else if(i == 8){
                point = _bottomDrawPointVector[9];
            }
            else if(i == 9){
                point = _bottomDrawPointVector[8];
            }
        }
        
        
        
        CGFloat topInHeight = point.y+[[_resHeightDic objectForKey:[NSNumber numberWithInt:i]] floatValue];
        if (topInHeight<TopLineHeight) {
            continue;
        }
        if ((point).y>BottomLineHeight) {
            break;
        }
        if (isFirst) {
            _visibleRange.location = i;
            _topRange.length = _topEntityVector.size()-i;
            isFirst = NO;
        }
        UIView *view = [self drawView:point index:i];
        [_visibleViews addObject:view];
        _visibleRange.length++;
    }
}

#pragma mark - Action
/**
 *  重新加载
 */
- (void)reloadData
{
    for (UIView *resView in _visibleViews) {
        [resView removeFromSuperview];
    }
    [_bodyView removeFromSuperview];
    _bodyView = nil;
    
    [self clearVector];
    [self initialize];
}

/**
 *  初始化
 */
- (void)initialize
{
    NSAssert([self.waterDataSource respondsToSelector:@selector(infoOfWaterView:)]
             ,@"infoOfWaterView must be implement");
    _waterInfo = [self.waterDataSource infoOfWaterView:self];
    
    //检查外部系统配置
    [self checkWaterInfo];
    
    //初始化容器
    _visibleViews = [NSMutableArray array];
    _reusedViews = [NSMutableDictionary dictionary];
    _resHeightDic = [NSMutableDictionary dictionary];
    _visibleRange = NSMakeRange(0, 0);
    _topRange = NSMakeRange(0, 0);
    
    //计算节点宽度
    _resWidth = (UI_SCREEN_WIDTH - _waterInfo.leftMargin-_waterInfo.rightMargin-(_waterInfo.numOfColumn-1)*_waterInfo.horizonPadding)/(_waterInfo.numOfColumn);
    
    //配置模拟节点指针
    for (int i=0; i<_waterInfo.numOfColumn; i++) {
        CGPoint point = CGPointMake(_waterInfo.leftMargin+(_resWidth+_waterInfo.horizonPadding)*i, 0);
        CGPoint *drawPointer = (CGPoint *)malloc(sizeof(CGPoint));
        *drawPointer = point;
        _simulatePointVector.push_back(drawPointer);
    }
    
    //配置节点
    NSAssert([self.waterDataSource respondsToSelector:@selector(numberOfFlowViewInWaterView:)]
             ,@"numberOfFlowViewInWaterView must be implement");
    int numbers = [self.waterDataSource numberOfFlowViewInWaterView:self];
    for (int i=0; i<numbers; i++) {
        NSAssert([self.waterDataSource respondsToSelector:@selector(waterView:heightOfFlowViewAtIndex:)]
                 ,@"waterView:heightOfFlowViewAtIndex: must be implement");
        CGFloat flowViewHeight = [self.waterDataSource waterView:self heightOfFlowViewAtIndex:i];
        //
        [_resHeightDic setObject:[NSNumber numberWithFloat:flowViewHeight] forKey:[NSNumber numberWithInt:i]];
        
        //
        [self recordDrawPointByHeight:flowViewHeight index:i];
    }

    //排序绘制点+绘制高度
    stable_sort(_topEntityVector.begin(), _topEntityVector.end(), less_second);
    
    
    //初始化视图
    self.contentSize = CGSizeMake(self.frame.size.width, _topEntityVector[0].point.y);
    [self initView];
}

//排序方法
bool less_second(const TopEntity *m1, const TopEntity *m2) {
    return m1.point.y > m2.point.y;
}

/**
 *  记录绘制点
 *
 *  @param height 高度
 *  @param index  序号
 */
- (void)recordDrawPointByHeight:(CGFloat)height index:(NSInteger)index
{
    CGPoint *drawPointer = _simulatePointVector[0];
    for (int i=1; i!=_simulatePointVector.size(); i++) {
        //
        CGPoint *nextDrawPointer = _simulatePointVector[i];
        if ((*nextDrawPointer).y<(*drawPointer).y) {
            drawPointer = nextDrawPointer;
        }
    }

    _bottomDrawPointVector.push_back(*drawPointer);
    (*drawPointer).y += height+_waterInfo.veticalPadding;
    
    TopEntity *entity = [[TopEntity alloc] init];
    entity.point = *drawPointer;
    entity.index = index;
    _topEntityVector.push_back(entity);
}

/**
 *  检查外部系统配置
 */
- (void)checkWaterInfo
{
    //to do
}

/**
 *  结束加载更多
 */
- (void)endLoadMore
{
    [_footView removeFromSuperview];
    _footView = nil;
}

/**
 *  清除非oc变量
 */
- (void)clearVector
{ 
    _bottomDrawPointVector.clear();
    _topEntityVector.clear();
    
    for (int i=0;i<_simulatePointVector.size();i++) {
        free(_simulatePointVector[i]);
    }
    _simulatePointVector.clear();
}

#pragma mark - ScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self waterScroll:scrollView];
    if ([_waterDelegate respondsToSelector:@selector(phoneWaterViewDidScroll:)]) {
        [_waterDelegate phoneWaterViewDidScroll:self];
    }
}

#pragma mark - CHFlowViewDelegate
- (void)pressedAtFlowView:(CHFlowView *)flowView
{
    if ([self.waterDelegate respondsToSelector:@selector(waterView:didSelectAtIndex:)]) {
        [self.waterDelegate waterView:self didSelectAtIndex:flowView.index];
    }
}

@end
