//
//  ViewController.m
//  TestWave
//
//  Created by lkp on 2017/12/7.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"
#import "WaveViewEx.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // wave
    WaveViewEx *waveView = [[WaveViewEx alloc] initWithAmplitude:20.0f colorStyle:WaveViewColorStyleLight];
    [self.view addSubview:waveView];
    [waveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(200);
    }];
    [waveView start];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
