//
//  ViewController.m
//  TestUI
//
//  Created by lkp on 2017/12/26.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *btn02;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UITableView *tableView;
@end
CGFloat distance = 10;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self createView];
//    [self createTableView];
//    [self testBlock];
//    [self testIntAndFloat];
}

- (void)testIntAndFloat {
    CGFloat i = 100.0f;
    int g = i;
    NSLog(@"i= %d",g);
    
    NSString *eightBit = @"127";
    NSLog(@"eightBit = %#o",[eightBit intValue]);
//    int idex = 080;
//    NSLog(@"%d",idex);
}

- (void)testBlock {
    void (^BlockName01)(void) = ^void(){
        NSLog(@"hello block");
    };
    BlockName01();
}


- (void)createView {
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [_btn setTitle:@"right move" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _btn02 = [[UIButton alloc] init];
    _btn02.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_btn02];
    [_btn02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_btn.mas_right).offset(10);
        make.top.equalTo(_btn.mas_bottom).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [_btn02 setTitle:@"test" forState:UIControlStateNormal];
}

- (void)createTableView {
    CGRect screen = [UIScreen mainScreen].bounds;
    _tableView = [[UITableView alloc] initWithFrame:screen style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor blueColor];
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view.mas_bottom).offset(-30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [_btn setTitle:@"right move" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark click method

- (void)BtnClick {
//    distance += 10;
//    [_btn02 mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.btn).offset(distance);
//    }];
    
//    [_tableView reloadData];
}



#pragma mark tableView delegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.textLabel.text = [NSString stringWithFormat:@"uitableViewCell%ld",indexPath.row];
    }
    NSLog(@"cellfor row %ld",indexPath.row);
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView cellForRowAtIndexPath:indexPath]) {
        NSLog(@"cell is exist");
    }
    
    if ([self tableView:tableView cellForRowAtIndexPath:indexPath]) {
        NSLog(@"cell is exist 02");
    }
    NSLog(@"height height = %ld",indexPath.row);
    return 60.0f;
}



@end
