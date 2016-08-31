//
//  Case1ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case1ViewController.h"

@interface Case1ViewController ()

@end

@implementation Case1ViewController
{
    // 左边
    UILabel *labelLeft;
    
    // 右边
    UILabel *labelRight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createView];
    
}

- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    labelLeft = [UILabel new];
    [self.view addSubview:labelLeft];
    labelLeft.backgroundColor = [UIColor yellowColor];
    
    labelRight = [UILabel new];
    [self.view addSubview:labelRight];
    labelRight.backgroundColor = [UIColor brownColor];
    
    // 位置约束
    [labelLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(80);
        make.left.equalTo(self.view.mas_left).with.offset(2);
        
        make.height.equalTo(@40);
    }];
    
    [labelRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(labelLeft.mas_right).with.offset(2);
        make.top.equalTo(self.view.mas_top).with.offset(80);
        
        make.right.lessThanOrEqualTo(self.view).with.offset(-2);
        make.height.equalTo(@40);
    }];
    
    
    
    // 内容约束
    
    // 设置 labelLeft 的 content Hugging 为 1000
    [labelLeft setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // 设置 labelLeft 的 content compression 为 1000
    [labelLeft setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // 设置 labelRight 的 content Hugging 为 1000
    [labelRight setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // 设置 labelRight 的 content compression 为 250
    [labelRight setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    // UIStepper
    UIStepper *stepperLeft = [UIStepper new];
    stepperLeft.tag = 1000;
    [self.view addSubview:stepperLeft];
    
    [stepperLeft addTarget:self action:@selector(clickStepper:) forControlEvents:UIControlEventTouchUpInside];
    
    UIStepper *stepperRight = [UIStepper new];
    stepperRight.tag = 1001;
    [self.view addSubview:stepperRight];
    
    [stepperRight addTarget:self action:@selector(clickStepper:) forControlEvents:UIControlEventTouchUpInside];
    
    // 位置约束
    [stepperLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(labelLeft.mas_bottom).with.offset(20);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        
        make.height.equalTo(@20);
    }];
    
    [stepperRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(labelRight.mas_bottom).with.offset(20);
        make.right.equalTo(self.view.mas_right).with.offset(10);
        
        make.height.equalTo(@20);
    }];
    
}

#pragma mark UI 方法
- (void)clickStepper:(UIStepper *)sender{
    
    
    switch (sender.tag) {
        case 1000:
            
            labelLeft.text = [self updateLabelText:(NSInteger)sender.value];
            
            
            break;
            
        case 1001:
            
            labelRight.text = [self updateLabelText:(NSInteger)sender.value];
            
            break;
            
        default:
            break;
    }
    
}

- (NSString *)updateLabelText:(NSInteger)value{
    
    NSString *text = @"";
    
    for(NSInteger i = 0; i < value; i++){
        
        text = [NSString stringWithFormat:@"%@label.",text];
    }
    return text;
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
