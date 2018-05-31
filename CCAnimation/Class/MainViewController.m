//
//  MainViewController.m
//  CCAnimation
//
//  Created by ZhangCc on 2018/5/28.
//  Copyright © 2018年 ZhangCc. All rights reserved.
//

#import "MainViewController.h"
#import "BasicViewController.h"
#import "KeyViewController.h"
#import "GroupViewController.h"
#import "TransitionViewController.h"
#import "CombinationViewController.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
    NSArray *_dataArray;
    NSArray *_titleArray;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    [self buildUI];
    [self loadData];
}

- (void)buildUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.sectionFooterHeight = 0.001;
    [self.view addSubview:_tableView];
}

- (void)loadData {
    _titleArray = @[@"基础动画",@"关键帧动画",@"组动画",@"过渡动画",@"组合动画"];
    
    NSArray *basicArray = @[@"位移",@"透明度",@"缩放",@"旋转",@"背景色"];
    NSDictionary *dict1 = @{@"value":basicArray};
    
    NSArray *keyArray = @[@"关键帧",@"路径",@"抖动"];
    NSDictionary *dict2 = @{@"value":keyArray};
    
    NSArray *groupArray = @[@"同时",@"连续"];
    NSDictionary *dict3 = @{@"value":groupArray};
    
    NSArray *transitionArray = @[@"Fade(渐变)",@"MoveIn(侧滑)",@"Push(推开)",@"Reveal(揭开)",@"Cube(立方旋转)",@"Suck(飘窗)",@"OglFile(翻片)",@"Ripple(涟漪)",@"Curl(撕开)",@"UnCurl(贴上)",@"CaOpen(相机镜头开放)",@"CaClose(相机镜头关闭)"];
    NSDictionary *dict4 = @{@"value":transitionArray};
    
    NSArray *combinationArray = @[@"添加",@"钉钉",@"点赞",@"贝塞尔曲线",@"进度条"];
    NSDictionary *dict5 = @{@"value":combinationArray};
    
    _dataArray = @[dict1, dict2, dict3, dict4, dict5];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = _dataArray[section];
    NSArray *array = dict[@"value"];
    return array.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _titleArray[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CELLID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    cell.textLabel.text = _dataArray[indexPath.section][@"value"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"-----%@", _dataArray[indexPath.section][@"value"][indexPath.row]);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 0) {
        BasicViewController *basicVC = [[BasicViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:basicVC animated:YES];
    }else if (indexPath.section == 1) {
        KeyViewController *keyVC = [[KeyViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:keyVC animated:YES];
    }else if (indexPath.section == 2) {
        GroupViewController *groupVC = [[GroupViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:groupVC animated:YES];
    }else if (indexPath.section == 3) {
        TransitionViewController *transitionVC = [[TransitionViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:transitionVC animated:YES];
    }else if (indexPath.section == 4) {
        CombinationViewController *combinationVC = [[CombinationViewController alloc] initWithType:indexPath.row];
        [self.navigationController pushViewController:combinationVC animated:YES];
    }
}


@end
