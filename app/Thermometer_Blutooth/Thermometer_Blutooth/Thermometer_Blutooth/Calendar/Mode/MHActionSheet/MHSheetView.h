//
//  MHSheetView.h
//  MHActionSheet
//
//  Created by LMH on 16/3/10.
//  Copyright © 2016年 LMH. All rights reserved.

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NSCellTextStyle) {
    NSTextStyleCenter = 0,    ///cell文字默认样式居中
    NSTextStyleLeft,          ///cell文字样式居左
    NSTextStyleRight,         ///cell文字样式居右
};

@protocol MHSheetViewDelegate <NSObject>
- (void)sheetViewDidSelectIndex:(NSInteger)Index selectTitle:(NSString *)title;
@end

@interface MHSheetView : UIView
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) id<MHSheetViewDelegate> delegate;
@property (strong, nonatomic) UIColor *cellTextColor;
@property (strong, nonatomic) UIFont *cellTextFont;
@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) BOOL showTableDivLine;
@property (assign, nonatomic) NSCellTextStyle cellTextStyle;
@property (strong, nonatomic) NSArray *dataSource1;
@property (strong, nonatomic) NSArray *dataSource2;
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com