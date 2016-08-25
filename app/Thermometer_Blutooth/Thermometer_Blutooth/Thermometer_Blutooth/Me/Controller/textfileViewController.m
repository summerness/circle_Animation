//
//  textfileViewController.m
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/9.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "textfileViewController.h"

@interface textfileViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>


@property (nonatomic ,strong) UITableView *tableView;


@end

@implementation textfileViewController

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(confirm)];
}



-(void)confirm{
    NSLog(@"%@", self.textfild.text);
    self.backValue(self.textfild.text);
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *Cell = [[UITableViewCell alloc]init];
    _textfild = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width-10, 50)];
    if(_holdertext)
        _textfild.placeholder = [NSString stringWithFormat:@"  %@",_holdertext];
    _textfild.delegate = self;
    [Cell addSubview:_textfild];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49, self.view.frame.size.width, 1)];
    line.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    [Cell addSubview:line];
   
    return Cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


@end
