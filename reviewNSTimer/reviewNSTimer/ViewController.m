//
//  ViewController.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2020/12/4.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 40)];
    [button setTitle:@"第二个页面" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(gotoSecondVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)gotoSecondVC {
    NSLog(@"gotoSecondVC");
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"had goto secondvc");
    }];
}

- (void)dealloc {
   
}


@end
