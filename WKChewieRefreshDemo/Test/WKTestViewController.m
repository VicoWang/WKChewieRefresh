//
//  WKTestViewController.m
//  WKChewieRefreshDemo
//
//  Created by 王昆 on 2017/11/16.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "WKTestViewController.h"
#import "UIScrollView+WKRefresh.h"

@interface WKTestViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation WKTestViewController

- (void)dealloc {
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView wk_configureRefresh];
    __weak typeof(self) weakSelf = self;
    self.tableView.wk_beginRefreshCallBack = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView wk_endRefresh];
        });
    };
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld行",indexPath.row];
    return cell;
}

@end
