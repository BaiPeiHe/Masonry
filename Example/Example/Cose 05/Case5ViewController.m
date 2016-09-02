//
//  Case5ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define ROW_HEIGHT 100

#import "Case5ViewController.h"

#import "Case5TableViewCell.h"

#import "Case5Model.h"

@interface Case5ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

// 数据
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation Case5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createData];
    
    [self createView];
}

- (void)createView{
    
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = ROW_HEIGHT;
    
    [self.tableView registerClass:[Case5TableViewCell class] forCellReuseIdentifier:NSStringFromClass([Case5TableViewCell class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 0));
        
    }];
}

- (void)createData{
    
    self.dataArr = [NSMutableArray array];
    
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    self.dataArr = [Case5Model baseModelByArr:rootDict[@"feed"]];
    
    [self.tableView reloadData];
}

#pragma mark TableView 的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Case5TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case5TableViewCell class]) forIndexPath:indexPath];
    
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
