


#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"
@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageview.image = [UIImage imageNamed:@""];
//    [self.view addSubview:imageview];

    UIView * view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor colorWithRed:58.0/255 green:193.0/255 blue:126.0/255 alpha:1];
    [self.view addSubview:view];
    
    
    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = self.view.bounds;
    tableview.backgroundColor = [UIColor greenColor];
    tableview.dataSource = self;
    tableview.delegate  = self;
    //tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    //tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
//        UIImageView * image = [UIImage imageNamed:@"i_icon_10"];
//        image.frame = CGRectMake(10, 10, 20, 20);
//        [self.view addSubview:image];
    }
    
    
    
    // NSArray * pathArray = [NSArray arrayWithObjects: @"i_icon_11",@"i_icon_12",@"i_icon_13",@"i_icon_14",@"i_icon_15",@"i_icon_16",nil];
//    NSInteger row = [indexPath row];
//    UIImage * image = [UIImage imageNamed:[pathArray objectAtIndex:row]];
    //cell.imageView.frame = CGRectMake(30, 30, 5, 5);
    
  
    
   // cell.imageView.image = image;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.backgroundColor = [UIColor colorWithRed:58.0/255 green:193.0/255 blue:126.0/255 alpha:1];
    cell.textLabel.textAlignment =UITextAlignmentCenter;
    cell.textLabel.textColor = [UIColor whiteColor];
    
//     NSArray * pathArray = [NSArray arrayWithObjects: @"i_icon_11",@"i_icon_12",@"i_icon_13",@"i_icon_14",@"i_icon_15",@"i_icon_16",nil];
//    cell.imageView.frame = CGRectMake(30, 30, 5, 5);
//        NSInteger row = [indexPath row];
//        UIImage * image = [UIImage imageNamed:[pathArray objectAtIndex:row]];
//    cell.imageView.frame = CGRectMake(30, 30, 5, 5);
//    cell.imageView.image = image;
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"蓝牙连接";

    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"账户管理";
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"系统设定";
    } else if (indexPath.row == 3) {
        cell.textLabel.text = @"阶段报告";
    } else if (indexPath.row == 4) {
        cell.textLabel.text = @"用户帮助";
    } else if (indexPath.row == 5) {
        cell.textLabel.text = @"历史数据";
    }
    

//    UIImage *image = [UIImage imageNamed:@"i_icon_11"];
//    cell.imageView.image = image;
//    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
    otherViewController *vc = [[otherViewController alloc] init];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
    
   //view.backgroundColor = [UIColor greenColor];
    return view;
}
@end
