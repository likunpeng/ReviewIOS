//
//  ViewController.m
//  TestCode
//
//  Created by lkp on 2017/12/14.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat angle;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [UIScreen mainScreen].bounds;
    _tableView = [[UITableView alloc] initWithFrame:screen style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor blueColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    [self.view addSubview:_tableView];
    [self testRotateImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark customMethod
- (void)testRotateImageView {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 80)];
    btn.titleLabel.text = @"测试";
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *img = [UIImage imageNamed:@"activity_noMore"];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100,20, 20)];
    _imageView.image = img;
    [self.view addSubview:_imageView];
}

- (void) testUIViewClcik {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300, 400)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(30, 40, 100, 60)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [view addSubview:btn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
#pragma mark uitableview datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"测试%ld", indexPath.row];
    NSLog(@"cell cell %ld",indexPath.row);
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"tableview address = %p", tableView);
    NSLog(@"self.tableview address = %p",self.tableView);
    if (cell) {
        NSLog(@"got");
    } else {
        NSLog(@"not got");
    }
//    UITableViewCell *cell02 = [self [su]
    NSLog(@"height height %ld",indexPath.row);
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected row = %ld",indexPath.row);
    [self.tableView reloadData];
}

#pragma mark action

- (void)btnClick {
    [self.imageView.layer removeAllAnimations];
    _angle = 0.0f;
//    [self startAnimation];
    [self startAnimation02];
}

- (void) startAnimation {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    _imageView.transform = CGAffineTransformMakeRotation(_angle*(M_PI/180.0f));
    [UIView commitAnimations];
}

- (void)endAnimation {
    _angle += 15;
    [self startAnimation];
}

- (void)startAnimation02 {
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angle*(M_PI/180.0f));
    [UIView animateWithDuration:0.1 animations:^{
        self.imageView.transform = endAngle;
    } completion:^(BOOL finished) {
        _angle += 15;
        [self startAnimation02];
    }];
}



@end
