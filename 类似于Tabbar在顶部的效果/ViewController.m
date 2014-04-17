//
//  ViewController.m
//  类似于Tabbar在顶部的效果
//
//  Created by hour on 14-4-16.
//  Copyright (c) 2014年 上海思墨信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "FirstView.h"
#import "SecondView.h"
#import "ThirdView.h"
@interface ViewController ()
{
    FirstView *firstView;
    SecondView *secondView;
    ThirdView *thirdView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initTopBtn];
    [self initContentView];
}
- (void)initTopBtn
{
    NSArray *titleArray = [NSArray arrayWithObjects:@"first",@"second",@"third", nil];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(0 + i * 90, 20, 80, 60);
        btn.tag = 10+i;
        btn.backgroundColor = [UIColor cyanColor];
        [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}
- (void)initContentView
{
    firstView = [[FirstView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT - 80)];
    firstView.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstView];
    
    secondView = [[SecondView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT - 80)];
    secondView.backgroundColor = [UIColor greenColor];
    secondView.hidden = YES;
    [self.view addSubview:secondView];
    
    thirdView = [[ThirdView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT - 80)];
    thirdView.backgroundColor = [UIColor blackColor];
    thirdView.hidden = YES;
    [self.view addSubview:thirdView];
}
#pragma mark -btn press
- (void)btnPress:(UIButton*)sender
{
    switch (sender.tag) {
        case 10:
            firstView.hidden = NO;
            secondView.hidden = YES;
            thirdView.hidden = YES;
            break;
        case 11:
            firstView.hidden = YES;
            secondView.hidden = NO;
            thirdView.hidden = YES;
            break;
        case 12:
            firstView.hidden = YES;
            secondView.hidden = YES;
            thirdView.hidden = NO;
            break;
            
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
