//
//  RootViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/30.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "RootViewController.h"

#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"
#import "Case4ViewController.h"
#import "Case5ViewController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end


@implementation RootViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self createData];
    
    [self createView];
    
}

- (void)createData{
    
    self.dataArr = [NSMutableArray arrayWithObjects:@"并排 Label",@"动态居中",@"百分百宽带",@"变高 UITableViewCell",@"top(bottom)LayoutGuide", nil];
}

- (void)createView{
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}


#pragma mark TableView 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case 0:{
            
            Case1ViewController *case1VC = [[Case1ViewController alloc] init];
            [self.navigationController pushViewController:case1VC animated:YES];
            
            break;
        }
        case 1:{
            
            Case2ViewController *case2VC = [[Case2ViewController alloc] init];
            [self.navigationController pushViewController:case2VC animated:YES];
            
            break;
        }
        case 2:{
            
            Case3ViewController *case3VC = [[Case3ViewController alloc] init];
            [self.navigationController pushViewController:case3VC animated:YES];
            
            break;
        }
        case 3:{
            
            Case4ViewController *case4VC = [[Case4ViewController alloc] init];
            [self.navigationController pushViewController:case4VC animated:YES];
            
            break;
        }
        case 4:{
            
            Case5ViewController *case5VC = [[Case5ViewController alloc] init];
            [self.navigationController pushViewController:case5VC animated:YES];
            
            break;
        }
        default:
            break;
    }
    
}



@end
