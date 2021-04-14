//
//  SecondViewController.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2020/12/4.
//

#import "SecondViewController.h"
#import "PFTimer.h"

@interface SecondViewController ()

//@property (nonatomic, strong) NSTimer *timer;

/// 使用PFTimer定义尝试下
@property (nonatomic, strong) PFTimer *timer;


@end
static NSString *str;
@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 40)];
    [button setTitle:@"第一个页面" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(gotoFirstVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 这种调用方式
    __block int i = 1;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"inter vc count = %ld", CFGetRetainCount((__bridge CFTypeRef)self));
//        i = i + 2;
//        NSLog(@"i = %d", i);
////        if (i == 100 && timer) {
////            [timer invalidate];
////            timer = nil;
////        }
//    }];
    self.timer = [[PFTimer alloc] init];
    [self.timer startTimer];
    str = [NSString stringWithFormat:@"hhhh"];
//    [self.timer fire];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)gotoFirstVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 说明：为什么在这里进行释放？因为timer 不仅仅被当前self拥有 同事系统也会拥有相应的nstier nstimer和runloop相互绑定 因为nstimer没有被释放 所以需要在dealloc提前释放和置空
 */
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear");
}

- (void)dealloc {
    NSLog(@"delloc");
    NSLog(@"%s", __func__);
//    if (self.timer) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
    
    [self.timer destoryTimer];
    NSLog(@"after invalidate count = %ld", CFGetRetainCount((__bridge CFTypeRef)self));
    
}

@end
