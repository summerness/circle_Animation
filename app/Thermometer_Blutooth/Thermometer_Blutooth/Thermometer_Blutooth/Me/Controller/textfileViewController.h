//
//  textfileViewController.h
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/9.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Width self.view.frame.size.width
#define Height self.view.frame.size.height


@interface textfileViewController : UIViewController

@property (nonatomic, strong) void (^backValue)(NSString *strValue);

@property (nonatomic ,strong) UITextField *textfild;

@property (nonatomic ,strong) NSString *holdertext;

@end
