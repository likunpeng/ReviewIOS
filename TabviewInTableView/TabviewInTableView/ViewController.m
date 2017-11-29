//
//  ViewController.m
//  TabviewInTableView
//
//  Created by lkp on 2017/11/8.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView *outerTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //create outer tableview
    _outerTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _outerTableView.delegate = self;
}


@end
