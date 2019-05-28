//
//  TestSegViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/28.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "TestSegViewController.h"
#import "TestCustomMenuBar.h"
#import "HomrProductMenuBarItem.h"

@interface TestSegViewController ()<HXMenuBarViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HXMenuBarView  *menuBarView;  // 推荐产品View
@property (nonatomic, strong) UITableView  *tableView01;

@end

@implementation TestSegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TestCustomMenuBar *menuBar = [[TestCustomMenuBar alloc] initWithHeight:S(50.0f)];
    menuBar.distanceToLeft = S(5.0f);
    self.menuBarView = [[HXMenuBarView alloc] initWithMenuBar:menuBar];
    _menuBarView.delegate = self;
    [self.view addSubview:_menuBarView];
    [_menuBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(60.0f);
        make.height.mas_equalTo(S(400.0f));
    }];
    [self createProductMenu];
}

// 创建产品切换按钮
- (void)createProductMenu {
    NSMutableArray *menuBarViews = [NSMutableArray array];

    UIView *pastView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, S(300.0f), S(400.0f))];
    [pastView addSubview:[self createView01]];
    pastView.backgroundColor = COLOR_RED;
    pastView.menuBarItem = [[HomrProductMenuBarItem alloc] initWithSeperator: YES];
    pastView.menuBarItem.title = @"past";
    [menuBarViews addObject:pastView];

    UIView *goingView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, S(300.0f), S(400.0f))];
    goingView.backgroundColor = COLOR_GOLD;
    goingView.menuBarItem = [[HomrProductMenuBarItem alloc] initWithSeperator: NO];
    goingView.menuBarItem.title = @"ONGOING";
    [menuBarViews addObject:goingView];
    [_menuBarView setContentViews:menuBarViews];
    _menuBarView.selectedIndex = 0;
    [_menuBarView show];
}

- (UITableView *)createView01 {
    self.tableView01 = [[UITableView alloc] initWithFrame:CGRectMake(S(100.0f), 0.0f, S(251), S(500.0f)) style:UITableViewStylePlain];
    _tableView01.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView01.delegate = self;
    _tableView01.dataSource = self;
    _tableView01.backgroundColor = COLOR_RED;
    _tableView01.showsVerticalScrollIndicator = NO;
    return self.tableView01;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return S(94.0f);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = COLOR_BG_GRAY;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - HXMenuBarViewDelegate
- (void)menuBarView:(HXMenuBarView*)menuBarView didSelectItemAtIndex:(NSUInteger)selectedIndex {
    // 刷新选中产品优惠券
    NSLog(@"selectedIndex %ld", selectedIndex);
}

@end
