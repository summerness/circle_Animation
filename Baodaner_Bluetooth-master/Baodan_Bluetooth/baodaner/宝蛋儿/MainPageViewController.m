

#import "MainPageViewController.h"
#import "AppDelegate.h"
#import "LeftSlideViewController.h"
#import "RightViewController.h"
#import "iconData.h"
#import "CHWaterView.h"
#import "headquickViewController.h"
#import "headaccurateViewController.h"
#import "ColpusViewController.h"


#define vBackBarButtonItemName  @"backArrow.png"    //导航条返回默认图片名
@interface MainPageViewController ()<CHWaterViewDatasource,CHWaterViewDelegate>


@property (nonatomic , strong) CHWaterView *waterView;

@property (nonatomic , strong) CHWaterView *waterViewfoot;

@property (nonatomic , strong) NSMutableArray *testDataArr;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"宝蛋儿";
//    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],UITextAttributeFont : [UIFont boldSystemFontOfSize:18]};
    self.view.backgroundColor = [UIColor grayColor];
    
    [self createUInavigationItem];
    
    _waterView = [[CHWaterView alloc]  initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _waterView.waterDataSource = self;
    _waterView.waterDelegate = self;
    _waterView.isDataEnd = YES;
    _waterView.backgroundColor = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    
    [self.view addSubview:_waterView];
    [self setupdataArr];
    
    [_waterView reloadData];
  

}

-(void)setupdataArr{
    NSLog(@"%-f",self.view.frame.size.height);
    int height00 = [UIScreen mainScreen].bounds.size.height;
    int heights[11] =  {152,152,182,119,151,88,88,88,138,138};
    UIColor *corlor1 = [UIColor colorWithRed:(CGFloat)59/255 green:(CGFloat)165/255 blue:(CGFloat)220/255 alpha:1];
    UIColor *corlor2 = [UIColor colorWithRed:(CGFloat)35/255 green:(CGFloat)201/255 blue:(CGFloat)111/255 alpha:1];
    UIColor *corlor3 = [UIColor colorWithRed:(CGFloat)49/255 green:(CGFloat)194/255 blue:(CGFloat)124/255 alpha:1];
    UIColor *corlor4 = [UIColor colorWithRed:(CGFloat)234/255 green:(CGFloat)82/255 blue:(CGFloat)41/255 alpha:1];
    UIColor *corlor5 = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    UIColor *corlor6 = [UIColor colorWithRed:(CGFloat)59/255 green:(CGFloat)165/255 blue:(CGFloat)220/255 alpha:1];
    UIColor *corlor7 = [UIColor colorWithRed:(CGFloat)234/255 green:(CGFloat)82/255 blue:(CGFloat)41/255 alpha:1];
    UIColor *corlor8 = [UIColor colorWithRed:(CGFloat)35/255 green:(CGFloat)201/255 blue:(CGFloat)111/255 alpha:1];
    UIColor *corlor9 = [UIColor colorWithRed:(CGFloat)254/255 green:(CGFloat)92/255 blue:(CGFloat)34/255 alpha:1];
    UIColor *corlor10 = [UIColor colorWithRed:(CGFloat)43/255 green:(CGFloat)43/255 blue:(CGFloat)68/255 alpha:1];
    NSArray *corlors = [NSArray arrayWithObjects:corlor1,corlor2,corlor3,corlor4,corlor5,corlor6,corlor7,corlor8,corlor9,corlor10, nil];
    _testDataArr = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        iconData *data = [[iconData alloc] init];
        data.height = heights[i]*height00/760;
        data.color = corlors[i];
        [_testDataArr addObject:data];
    }
}


#pragma mark - CHWaterViewDatasource
- (NSInteger)numberOfFlowViewInWaterView:(CHWaterView *)waterView
{
    return [_testDataArr count];
}

- (CustomWaterInfo *)infoOfWaterView:(CHWaterView*)waterView
{
    CustomWaterInfo *info = [[CustomWaterInfo alloc] init];
    info.topMargin = 8;
    info.leftMargin = 6;
    info.bottomMargin = 0;
    info.rightMargin = 6;
    info.horizonPadding = 6;
    info.veticalPadding = 6;
    info.numOfColumn = 2;
    return info;
}

- (CHFlowView *)waterView:(CHWaterView *)waterView flowViewAtIndex:(NSInteger)index
{
    iconData *data = [_testDataArr objectAtIndex:index];
    CHFlowView *flowView = [waterView dequeueReusableCellWithIdentifier:@"cell"];
    if (flowView == nil) {
        flowView = [[CHFlowView alloc] initWithFrame:CGRectZero];
        flowView.reuseIdentifier = @"cell";
    }
    int width0 = [[UIScreen mainScreen] bounds].size.width;
    
    
    flowView.index = index;
    flowView.backgroundColor = data.color;
    float k = (float)width0/414;
    // NSLog(@"%f-----%d",k,width0);
    
    NSLog(@"%f-----%d",flowView.frame.size.height , flowView.index);
    
    if(flowView.index == 0){
        flowView.centryimgv.image = [UIImage imageNamed:@"i_icon_46"];
        flowView.centrylable.text =  @"额头极速测量";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
    }
    else if(flowView.index == 1){
        
        flowView.leftimgv.image = [UIImage imageNamed:@"i_icon_47"];
        flowView.rightlable.text =  @"额头精准测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
    }
    else if(flowView.index == 2){
        
        
        flowView.centryimgv.image = [UIImage imageNamed:@"i_icon_48"];
        flowView.centrylable.text =  @"胸前连续测量";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];
        
        return flowView;
    }
    else if(flowView.index == 3){
        
        
        flowView.leftimgv1.image = [UIImage imageNamed:@"i_icon_49"];
        flowView.rightlable.text =  @"拇指心率测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
    }
    else if(flowView.index == 4){
        flowView.imgv.image = [UIImage imageNamed:@"baby_1.jpg"];
        return flowView;
    }
    
    else if(flowView.index == 5){
        flowView.midlable.text =  @"奶水极速测量";
        flowView.shadowsview.hidden = NO;
        flowView.lockview.hidden = NO;
        flowView.midlable.font = [UIFont systemFontOfSize:18*k];
        return flowView;
        
    }
    
    else if(flowView.index == 6){
        flowView.midlable.text =  @"中医远程问诊";
        flowView.midlable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
        flowView.lockview.hidden = NO;
        return flowView;
    }
    
    else if(flowView.index == 7){
        flowView.leftimgv2.image = [UIImage imageNamed:@"i_icon_50"];
        flowView.rightlable.text =  @"精准血压测量";
        flowView.rightlable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
        flowView.lockview.hidden = NO;
        return flowView;
        
    }
    else if(flowView.index == 8){
        
        flowView.centryimgv1.image = [UIImage imageNamed:@"i_icon_51"];
        flowView.centrylable.text =  @"婴儿啼哭识别";
        flowView.centrylable.font = [UIFont systemFontOfSize:18*k];
        flowView.shadowsview.hidden = NO;
        flowView.lockview.hidden = NO;
        return flowView;
    }
    else if (flowView.index == 9){
        flowView.but1.hidden = NO;
        flowView.but2.hidden = NO;
        flowView.shadowsview1.hidden = NO;
        flowView.shadowsview2.hidden = NO;
        flowView.lockview1.hidden = NO;
        flowView.lockview2.hidden = NO;
        
        return flowView;
    }
    else return nil;
}

- (CGFloat)waterView:(CHWaterView *)waterView heightOfFlowViewAtIndex:(NSInteger)index
{
    iconData *data = [_testDataArr objectAtIndex:index];
    return data.height;
}


#pragma mark - CHWaterViewDelegate


- (void)phoneWaterViewDidScroll:(CHWaterView *)waterView
{
    //do what you want to do
    return;
}

- (void)waterView:(CHWaterView *)waterView didSelectAtIndex:(NSInteger)index
{
    NSLog(@"didSelectAtIndex%d",index);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.image = [UIImage imageNamed:@"back"];
    self.navigationItem.backBarButtonItem = backItem;
    
    if(index == 0){
        headquickViewController *headquick = [[headquickViewController alloc]init];

        [self.navigationController pushViewController:headquick animated:YES];
    }
    else if(index == 1){
        headaccurateViewController *headacc = [[headaccurateViewController alloc]init];
        
        [self.navigationController pushViewController:headacc animated:YES];
    }
    else if(index == 2){
        ColpusViewController *colpus = [[ColpusViewController alloc]init];
        [self.navigationController pushViewController:colpus animated:YES];
    }
}



#pragma mark - 导航控制器
-(void)createUInavigationItem
{
    UIButton * leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(0, 0, 35, 30);
    
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"i_icon_7"] forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    
    UIButton * rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(270, 0, 35, 35);
    
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"i_icon_8"] forState:UIControlStateNormal];
    [rightbtn addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
    
}

#pragma mark - 点击事件

-(void)rightClick
{
    RightViewController * right = [[RightViewController alloc] init];
    [self.navigationController pushViewController:right animated:YES];
   // self.navigationController.navigationBar.hidden = YES;
    
}

- (void) openOrCloseLeftList
{
    AppDelegate * tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (tempAppDelegate.LeftSlideVC.closed)
    {
        [tempAppDelegate.LeftSlideVC openLeftView];
    }
    else
    {
        [tempAppDelegate.LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppDelegate.LeftSlideVC setPanEnabled:YES];
}

@end
