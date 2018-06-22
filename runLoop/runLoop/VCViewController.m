//
//  VCViewController.m
//  runLoop
//
//  Created by lkp on 2018/3/6.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "VCViewController.h"
#import "VBViewController.h"

@interface VCViewController ()

@end

@implementation VCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CCC";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn {
    [self dismissModalStack];
}

- (void)dismissModalStack {
    
    UIViewController *vc = self.presentingViewController;
    NSLog(@"vc name = %@", [vc class]);
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
        NSLog(@"inner vc name = %@", [vc class]);
    }
    
    [vc dismissViewControllerAnimated:YES completion:NULL];

    
//    while (vc.presentingViewController) {
//        if ([vc isKindOfClass:[VBViewController class]]) {
//            break;
//        }
//        vc = vc.presentingViewController;
//        NSLog(@"name = %@",[vc class]);
//    }
//
//    [vc dismissViewControllerAnimated:YES completion:^{
//        [vc dismissViewControllerAnimated:YES completion:^{
//
//        }];
//    }];s
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
