//
//  Case4ViewController.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define ROW_HIGHT 80

#define COUNT 20

#import "Case4ViewController.h"
#import "AutoHightTableViewCell.h"

@interface Case4ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation Case4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createData];
    
    [self createView];
    
}

- (void)createData{
    
    self.dataArr = [NSMutableArray array];
    
    for(NSInteger i = 0; i < COUNT; i++){
        
        NSString *content;
        
        for(NSInteger j = 0; j < i * 5 + 5; j ++){
            
            content = [NSString stringWithFormat:@"%@content - ",content];
        }
        [self.dataArr addObject:content];
    }
}


- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.tableView.backgroundColor = [UIColor brownColor];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = ROW_HIGHT;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[AutoHightTableViewCell class] forCellReuseIdentifier:NSStringFromClass([AutoHightTableViewCell class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0, 0, 0));
        
    }];
    
}

#pragma mark UITableView 的协议方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AutoHightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AutoHightTableViewCell class]) forIndexPath:indexPath];
    
    [cell setTitle:[NSString stringWithFormat:@"标题%ld",indexPath.row] Content:self.dataArr[indexPath.row]];
    
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
