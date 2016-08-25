

//
//  medetailViewController.m
//  Thermometer_Blutooth
//
//  Created by summer_ness on 16/8/8.
//  Copyright © 2016年 summer_ness. All rights reserved.
//

#import "medetailViewController.h"
#import "headerimageTableViewCell.h"
#import "MHActionSheet.h"
#import "YSHYClipViewController.h"
#import "textfileViewController.h"
#import "STPickerDate.h"
#import "passwordViewController.h"
@interface medetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ClipViewControllerDelegate,STPickerDateDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *selectSource;

@property (strong, nonatomic) UIImagePickerController * imagePicker;

@property (strong, nonatomic) UIImage *headerimage;

@property (strong, nonatomic) NSString *username;

@property (strong, nonatomic) NSString *birthdate;

@property (strong, nonatomic) NSString *phonenum;
@end

@implementation medetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor clearColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,Width , Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 3;
    }
    else
        return 2;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            headerimageTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
            if (!Cell)
            {
                [tableView registerNib:[UINib nibWithNibName:@"headerimageTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
                Cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
                
            }
            //Cell.textLabel.text = @"头像";
            if(_headerimage)
            Cell.headerimg.image = _headerimage;
            return Cell;
        }
        else if (indexPath.row == 1){
            cell.textLabel.text = @"昵称";
            if(_username)
                cell.detailTextLabel.text = _username;
            return cell;
        }
        else {
            cell.textLabel.text = @"生日";
            if(_birthdate)
                cell.detailTextLabel.text = _birthdate;
            return cell;
        }
    }
    else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改密码";
            return cell;
        }
        else {
            cell.textLabel.text = @"手机号码";
            if(_phonenum)
                cell.detailTextLabel.text = _phonenum;
            return cell;
        }
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            UIImage *imag1 = [UIImage imageNamed:@"order_selected"];
            UIImage *imag2 = [UIImage imageNamed:@"order_selected"];
            NSArray *arry = [NSArray arrayWithObjects:imag1,imag2, nil];
            MHActionSheet *actionSheet = [[MHActionSheet alloc] initSheetWithTitle:nil style:MHSheetStyleTable itemTitles:@[@"从手机相册选择",@"拍照"] images:arry];
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行",index];
                NSLog(@"%@",text);
                
                if(index == 0)
                    [self openCamera];
                else if(index == 1)
                    [self openPhoto];
            }];
        }
        else if(indexPath.row == 1){
            textfileViewController *textfile = [[textfileViewController alloc]init];
            textfile.holdertext = @"昵称";
            textfile.backValue = ^(NSString *strValue) {
                _username = strValue;
            };
            [self.navigationController pushViewController:textfile animated:YES];
            
        }
        else if(indexPath.row == 2){
            STPickerDate *pickerDate = [[STPickerDate alloc]init];
            [pickerDate setDelegate:self];
            [pickerDate show];
        }
    }
     else if(indexPath.section == 1){
         if(indexPath.row == 0){
             passwordViewController *psw = [[passwordViewController alloc]init];
             [self.navigationController pushViewController:psw animated:YES];
         }
         else if(indexPath.row == 1){
             textfileViewController *textfile = [[textfileViewController alloc]init];
             textfile.holdertext = @"手机号";
             textfile.backValue = ^(NSString *strValue) {
                 _phonenum = strValue;
             };
             [self.navigationController pushViewController:textfile animated:YES];
         }
        
     }
}

- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    NSString *text = [NSString stringWithFormat:@"%d年%d月%d日", year, month, day];
    
    _birthdate = text;
    [self.tableView reloadData];
  
}

/**
 *  打开相机
 */
- (void)openCamera
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
}
- (void)openPhoto
{
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}


#pragma mark - imagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
    
    YSHYClipViewController * clipView = [[YSHYClipViewController alloc]initWithImage:image];
    clipView.delegate = self;
    clipView.clipType = SQUARECLIP; //支持圆形:CIRCULARCLIP 方形裁剪:SQUARECLIP   默认:圆形裁剪
    
    [picker pushViewController:clipView animated:YES];
    
}

#pragma mark - ClipViewControllerDelegate
-(void)ClipViewController:(YSHYClipViewController *)clipViewController FinishClipImage:(UIImage *)editImage
{
    [clipViewController dismissViewControllerAnimated:YES completion:^{
        _headerimage = editImage;
        [self.tableView reloadData];
    }];;
}





@end
