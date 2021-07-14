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
@property (nonatomic, strong) UIView *subView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //create outer tableview
//    _outerTableView = [[UITableView alloc] initWithFrame:self.view.frame];
//    _outerTableView.delegate = self;
    
    self.subView = [[UIView alloc] init];
    self.subView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.subView];
    self.subView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *subViewLeftConstraint = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    NSLayoutConstraint *subViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    NSLayoutConstraint *subViewWidth = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    NSLayoutConstraint *subViewHeight = [NSLayoutConstraint constraintWithItem:self.subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
//    [self.view addConstraint:subViewLeftConstraint];
//    [self.view addConstraint:subViewTopConstraint];
//    [self.view addConstraint:subViewWidth];
//    [self.view addConstraint:subViewHeight];
    [self.view addConstraints:@[subViewLeftConstraint, subViewTopConstraint, subViewWidth, subViewHeight]];
    
    
    
}


@end
