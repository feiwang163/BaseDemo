//
//  BaseRefreshViewController.m
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "BaseRefreshViewController.h"
#import "WF_RefreshGifHeader.h"
#import "WF_RefreshGifFooter.h"
#import <UIScrollView+EmptyDataSet.h>
#import "RecommentRefreshHeader.h"

@interface BaseRefreshViewController ()<UITableViewDataSource,UITableViewDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>


@property (nonatomic, getter=isLoading) BOOL loading;

@end

@implementation BaseRefreshViewController

- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.emptyDataSetSource = self;
        _tableView.emptyDataSetDelegate = self;
#pragma mark 第一种加载状态
//        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//        [header setImages:@[[UIImage imageNamed:@"bdj_mj_refresh_2"]] forState:MJRefreshStateIdle];
//        [header setImages:@[[UIImage imageNamed:@"bdj_mj_refresh_1"]] forState:MJRefreshStatePulling];
//        [header setImages:@[[UIImage imageNamed:@"bdj_mj_refresh_1"],
//                            [UIImage imageNamed:@"bdj_mj_refresh_2"],
//                            [UIImage imageNamed:@"bdj_mj_refresh_3"],
//                            [UIImage imageNamed:@"bdj_mj_refresh_4"]] forState:MJRefreshStateRefreshing];
//        _tableView.mj_header = header;
//        
//        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//        
//        _tableView.mj_footer.hidden = YES;
        
#pragma mark 第二种加载状态
        WF_RefreshGifHeader *header = [WF_RefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        
        WF_RefreshGifFooter *footer = [WF_RefreshGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        
        // 隐藏时间
        header.lastUpdatedTimeLabel.hidden = YES;
        
        // 隐藏状态
        header.stateLabel.hidden = YES;
        
        footer.stateLabel.hidden = NO;
        
//        RecommentRefreshHeader *recomentHeader = [RecommentRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        
        
        
        self.tableView.mj_header = header;
        self.tableView.mj_footer = footer;
    
        
    }
    return _tableView;
}

- (void)setLoading:(BOOL)loading
{
    if (self.isLoading == loading) {
        return;
    }
    
    _loading = loading;
    
    [self.tableView reloadEmptyDataSet];
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)loadNewData {}
- (void)loadMoreData {}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark DZNEmpty Delegate
// 标题文字
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    
    text = @"暂无数据";
    font = [UIFont boldSystemFontOfSize:14.0];
    textColor = RGB(85, 85, 85);
    
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
}
// 设置背景图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    
    if (self.isLoading) {
        return [UIImage imageNamed:@"loading_imgBlue_78x78"];
    } else {
        return [UIImage imageNamed:@"placeholder_fancy"];
    }
}
// 详情文字
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    text = @"请点击图标刷新页面";
    font = [UIFont systemFontOfSize:12.0];
    textColor = RGB(85, 85, 85);
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    if (!text) {
        return nil;
    }
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (CAAnimation *) imageAnimationForEmptyDataSet:(UIScrollView *) scrollView {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D: CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0) ];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.isLoading;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    self.loading = YES;
    [self loadNewData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        self.loading = NO;
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
