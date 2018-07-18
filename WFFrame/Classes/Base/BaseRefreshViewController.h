//
//  BaseRefreshViewController.h
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "BaseViewController.h"
#import "MJRefresh.h"

@interface BaseRefreshViewController : BaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) NSArray *dataArr;
- (void)loadNewData;
- (void)loadMoreData;

@end
