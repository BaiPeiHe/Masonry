//
//  Case2ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

static const CGFloat IMAGE_SIZE_WIDTH = 32;
static const CGFloat IMAGE_SIZE_HEIGHT = 32;
static const CGFloat COUNT = 4;

#import "Case2ViewController.h"

@interface Case2ViewController ()

@end


@implementation Case2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createView];
    
}

- (void)createView{
    
    UIView *containtView = [UIView new];
    [self.view addSubview:containtView];
    
    [containtView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
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
