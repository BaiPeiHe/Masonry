//
//  Case6ViewController.m
//  Example
//
//  Created by 白鹤 on 16/9/2.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define ROW_HEIGHT 60

#import "Case6ViewController.h"
#import "Case6Model.h"
#import "Case6TableViewCell.h"

@interface Case6ViewController ()<UITableViewDelegate,UITableViewDataSource>

// 显示
@property (nonatomic, strong) UITableView *tableView;

// 数据
@property (nonatomic, strong) NSMutableArray *dataArr;



@end

@implementation Case6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    
    self.dataArr = [NSMutableArray array];
    
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.dataArr = [Case6Model baseModelByArr:rootDict[@"feed"]];
    
    [self.tableView reloadData];
    
    
}

- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor yellowColor];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = ROW_HEIGHT;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[Case6TableViewCell class] forCellReuseIdentifier:NSStringFromClass([Case6TableViewCell class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
}

#pragma mark UITableView 协议方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    void(^clickMoreAction)() = ^(){
        
        Case6Model *dataModel = self.dataArr[indexPath.row];
        
        dataModel.expanded = !dataModel.expanded;
        [self.dataArr replaceObjectAtIndex:indexPath.row withObject:dataModel];
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    
    
    Case6TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case6TableViewCell class]) forIndexPath:indexPath];
    
    cell.clickMoreAction = clickMoreAction;
    cell.dataModel = self.dataArr[indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
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
