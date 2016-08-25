//
//  passwordViewController.m
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/9.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "passwordViewController.h"

@interface passwordViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>


@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) UITableViewCell *Cell;

@end

@implementation passwordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor clearColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,Width , Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touch)];
    [_tableView addGestureRecognizer:tap];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(confirm1)];

}

-(void)confirm1{
    NSLog(@"%@", self.textfild.text);
    
    NSMutableArray *arrry = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        UITableViewCell *cell = [_tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        UITextField *textf = cell.subviews[1];
        
        NSLog(@"11%@",textf.text);
        NSString *value = textf.text;
        if(value == nil)
        {
            value = [NSNull null];
        }
        [arrry addObject:value];
        }
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)touch{
    [_textfild resignFirstResponder];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc]init];
    _textfild = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width-10, 50)];
    _textfild.secureTextEntry = YES;
    _textfild.clearButtonMode = UITextFieldViewModeAlways;
    _textfild.delegate = self;
    [Cell addSubview:_textfild];
    if(indexPath.row == 0){
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, 1)];
        line.backgroundColor = [UIColor purpleColor];
        [Cell addSubview:line];
        _textfild.placeholder = @"请输入旧密码";
         return Cell;
    }
    else if(indexPath.row == 1) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, 1)];
        line.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
        _textfild.placeholder = @"请输入新密码";
        [Cell addSubview:line];
         return Cell;
    }
    else if(indexPath.row == 2) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, 1)];
        line.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
        _textfild.placeholder = @"请再次输入新密码";
        [Cell addSubview:line];
        return Cell;
    }
    else return nil;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

@end
