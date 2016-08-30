//
//  ViewController.m
//  Primary
//
//  Created by 白鹤 on 16/8/30.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




/**
 *  初级
 *  居中,略小,垂直居中,等距
 */
- (void)primary{
    
    // 居中
    UIView *sv = [[UIView alloc] init];
    sv.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        
    }];
    
    
    // 略小
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor brownColor];
    [sv addSubview:sv1];
    
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
    }];
    
    // 垂直居中 ,等宽 ,等间距(10)
    
    UIView *sv2 = [UIView new];
    sv2.backgroundColor = [UIColor redColor];
    [sv1 addSubview:sv2];
    
    UIView *sv3 = [UIView new];
    sv3.backgroundColor = [UIColor yellowColor];
    [sv1 addSubview:sv3];
    
    int padding = 10;
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(sv1.mas_centerY);
        make.left.equalTo(sv1.mas_left).with.offset(padding);
        make.right.equalTo(sv3.mas_left).with.offset(-padding);
        make.height.mas_equalTo(@100);
        make.width.equalTo(sv3);
        
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.mas_equalTo(sv1.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(padding);
        make.right.equalTo(sv1.mas_right).with.offset(-padding);
        make.height.mas_equalTo(@100);
        make.width.equalTo(sv2);
        
    }];
    
}
/**
 *  中级
 *
 */
- (void)middle{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    
    UIView *lastView = nil;
    
    for( int i = 1; i <= count; i++){
        
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithRed: (CGFloat)random()/(CGFloat)RAND_MAX green: (CGFloat)random()/(CGFloat)RAND_MAX blue: (CGFloat)random()/(CGFloat)RAND_MAX alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20 * i));
            
            if(lastView){
                
                make.top.mas_equalTo(lastView.mas_bottom);
                
            }
            else{
                
                make.top.mas_equalTo(container.mas_top);
                
            }
            
        }];
        
        lastView = subv;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(lastView.mas_bottom);
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
