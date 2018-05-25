//
//  VBViewController.m
//  runLoop
//
//  Created by lkp on 2018/3/6.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "VBViewController.h"
#import "VCViewController.h"

@interface VBViewController ()

@end

@implementation VBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name = %@",_name);
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = @"BBB";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn {
    VCViewController *vc = [[VCViewController alloc] init];
        vc.view.backgroundColor = [UIColor blueColor];
        [self presentViewController:vc animated:false completion:^{
            NSLog(@"completion turn VC");
        }];
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
