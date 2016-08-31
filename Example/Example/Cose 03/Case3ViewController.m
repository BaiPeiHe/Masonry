//
//  Case3ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case3ViewController.h"

@interface Case3ViewController ()

@end

@implementation Case3ViewController
{
    UIView *containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
}

- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    containerView = [UIView new];
    [self.view addSubview:containerView];
    
    containerView.backgroundColor = [UIColor yellowColor];
    
    
    UIView *subView = [UIView new];
    [containerView addSubview:subView];
    
    subView.backgroundColor = [UIColor brownColor];
    
    
    UISlider *slider = [UISlider new];
    [self.view addSubview:slider];
    
    [slider addTarget:self action:@selector(updateContainerViewFram:) forControlEvents:UIControlEventValueChanged];
    
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(200);
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.height.equalTo(@200);
        make.width.equalTo(self.view.mas_width).with.offset(-20);
        
    }];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(containerView.mas_top).with.offset(10);
        
        // 居中
        make.centerX.equalTo(containerView.mas_centerX);
        
        // 宽度为 父视图的 1/2
        make.width.equalTo(containerView.mas_width).multipliedBy(0.5);
        
        // 高度为 父视图的 1/3
        make.height.equalTo(containerView.mas_height).multipliedBy(0.3);
        
    }];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(containerView.mas_bottom).with.offset(20);
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.width.equalTo(self.view.mas_width).with.offset(-50);
    }];
}

- (void)updateContainerViewFram:(UISlider *)sender{
    
    [containerView mas_updateConstraints:^(MASConstraintMaker *make) {
       
        NSLog(@"%f",sender.value);
        CGFloat offsetWidth = self.view.frame.size.width * sender.value + 20;
        make.width.equalTo(self.view.mas_width).with.offset(-offsetWidth);
        
        CGFloat offsetHeight = self.view.frame.size.height - 200 + 200 * sender.value;
        make.height.equalTo(self.view.mas_height).with.offset(-offsetHeight);
        
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
