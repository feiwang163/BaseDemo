//
//  ViewController.m
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "ViewController.h"
#import "WFProgressHUD.h"
#import "WFActionSheet.h"
#import "SDCycleScrollView.h"
#import "WFProgressHUD.h"

@interface ViewController ()<BaseViewControllerDataSource,BaseViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [WFProgressHUD showNetworkError];
    
//    [WFProgressHUD showLoading:@""];
    
//    [self.view showLoading];
//    ÷÷÷÷÷÷÷÷÷÷÷÷/÷÷
    
//    ...
//    [self.view showText:@"加载中..."];
//    [self.view showProgress:50];
//    [self.view showErrorText:@"网络错误柔柔弱弱若若若若若若若若若若若若若"];
//    [self.view showSuccessText:@"成功"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
//    WFActionSheet *ac = [[WFActionSheet alloc] initWithTitles:@[@"1",@"2",@"3"] delegate:self cancelButtonTitle:@"取消"];
//    [ac show];
    
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    
    // 情景二：采用网络图片实现
//    NSArray *imagesURLStrings = @[
//                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
//                                  ];
//    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 280) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
//    cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
//
//
//    [self.view addSubview:cycleScrollView3];
    
//    // 网络加载 --- 创建只上下滚动展示文字的轮播器
//    // 由于模拟器的渲染问题，如果发现轮播时有一条线不必处理，模拟器放大到100%或者真机调试是不会出现那条线的
//    SDCycleScrollView *cycleScrollView4 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 750, w, 40) delegate:self placeholderImage:nil];
//    cycleScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
//    cycleScrollView4.onlyDisplayText = YES;
//    
//    NSMutableArray *titlesArray = [NSMutableArray new];
//    [titlesArray addObject:@"纯文字上下滚动轮播"];
//    [titlesArray addObject:@"纯文字上下滚动轮播 -- demo轮播图4"];
//    [titlesArray addObjectsFromArray:titles];
//    cycleScrollView4.titlesGroup = [titlesArray copy];
//    
//    [demoContainerView addSubview:cycleScrollView4];
    
    [self initData];
    
//   RAlertView *alert = [[RAlertView alloc] initWithStyle:CancelAndConfirmAlert];
//    alert.headerTitleLabel.text = @"123";
//    alert.isClickBackgroundCloseWindow = YES;
    
}

- (void)initData{
    [[NetworkTool sharedNetworkTool] POSTMethodWithApi:@"rest/service/commodity/product/get_commodity_detail" Parameters:@{@"prodNo":@"0200000150101"} Success:^(id response, NSString *str) {
        
        
        WFLog(@"%@",response);
        
    } Failure:^(NSError *error) {
        WFLog(@"%@",error);
    }];
    
}


- (UIColor *)set_colorBackground{
    UIColor *color = [UIColor redColor];
    return color;
}

- (UIView *)set_bottomView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

//- (CGFloat)set_navigationHeight{
//    return 100.;
//}
- (void)loadNewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.dataArr = @[@"1"];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    });
}
- (void)loadMoreData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.dataArr = @[];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indef = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indef];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indef];
    }
    
    cell.textLabel.text = @"1";
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
