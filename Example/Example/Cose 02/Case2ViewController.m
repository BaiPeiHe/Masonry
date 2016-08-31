//
//  Case2ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

static const CGFloat IMAGE_SIZE_WIDTH = 32;
static const CGFloat IMAGE_SIZE_HEIGHT = 32;
static const CGFloat COUNT = 10;

#import "Case2ViewController.h"

@interface Case2ViewController ()

// 保存视图的 宽约束
@property (nonatomic, strong)NSMutableArray * widthConstraint;

@end


@implementation Case2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createData];
    
    [self createView];
    
}

- (void)createData{
    
    self.widthConstraint = [NSMutableArray array];
    
}

- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *containtView = [UIView new];
    [self.view addSubview:containtView];
    
    [containtView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(80);
        // 水平居中
        make.centerX.equalTo(self.view.mas_centerX);
        // 只设置高度,宽度由子视图决定
        make.height.equalTo(@(IMAGE_SIZE_HEIGHT));
    }];
    
    
    UIView *preView = nil;
    
    for(NSInteger i = 0; i < COUNT; i++){
        
        UIView *view = [UIView new];
        [containtView addSubview:view];
        view.backgroundColor = [UIColor colorWithRed: (CGFloat)random()/(CGFloat)RAND_MAX green: (CGFloat)random()/(CGFloat)RAND_MAX blue: (CGFloat)random()/(CGFloat)RAND_MAX alpha:1];
        
        __block MASConstraint *widthContraint = nil;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 宽度,高度固定
            make.height.equalTo(@(IMAGE_SIZE_HEIGHT));
            widthContraint = make.width.equalTo(@(IMAGE_SIZE_WIDTH));
            
            // 水平居中
            make.centerY.equalTo(containtView.mas_centerY);
            
            if(preView){
                make.left.equalTo(preView.mas_right);
            }
            else{
                make.left.equalTo(containtView.mas_left);
            }
            
            if(i == COUNT - 1){
                make.right.equalTo(containtView.mas_right);
            }
        }];
        
        [self.widthConstraint addObject:widthContraint];
        preView = view;
    }
    
    
    // 开关
    UISwitch *preSwitch = nil;
    for(NSInteger i = 0; i < COUNT; i++){
        
        UISwitch *switchM = [UISwitch new];
        [self.view addSubview:switchM];
        
        switchM.tag = i + 1000;
        
        [switchM addTarget:self action:@selector(clicSwitch:) forControlEvents:UIControlEventTouchUpInside];
        
        [switchM mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 垂直居中
            make.centerX.equalTo(self.view.mas_centerX);
            
            // 高度固定
            make.height.equalTo(@(IMAGE_SIZE_HEIGHT));
            
            if(preSwitch){
                make.top.equalTo(preSwitch.mas_bottom);
            }
            else{
                make.top.equalTo(containtView.mas_bottom).with.offset(50);
            }
            
            if(i == COUNT - 1){
                
                make.bottom.equalTo(self.view.mas_bottom).with.offset(-50);
                
            }
        }];
        
        preSwitch = switchM;
    }
    
}


#pragma mark UI 方法

- (void)clicSwitch:(UISwitch *)sender{
    
    NSInteger index = sender.tag - 1000;
    
    NSLog(@"%ld",index);
    MASConstraint *width = self.widthConstraint[index];
    
    if(sender.on){
        width.equalTo(@0);
    }
    else{
        width.equalTo(@(IMAGE_SIZE_WIDTH));
    }
    
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
