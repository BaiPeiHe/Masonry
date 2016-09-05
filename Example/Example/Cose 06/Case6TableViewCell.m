//
//  Case6TableViewCell.m
//  Example
//
//  Created by 白鹤 on 16/9/5.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case6TableViewCell.h"

@interface Case6TableViewCell ()

// 标题
@property (nonatomic, strong) UILabel *titleLabel;

// 内容
@property (nonatomic, strong) UILabel *contentLabel;

// More
@property (nonatomic, strong) UIButton *moreBtn;

// 限制高度
@property (nonatomic, strong) MASConstraint *contentHeightConstraint;

@end

@implementation Case6TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self createView];
    }
    return self;
}


- (void)createView{
    
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.textColor = [UIColor blueColor];
    self.titleLabel.font = [UIFont systemFontOfSize:25];
    
    self.contentLabel = [UILabel new];
    [self.contentView addSubview:self.contentLabel];
    
    self.moreBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.contentView addSubview:self.moreBtn];
    
    [self.moreBtn setTitle:@"More" forState:UIControlStateNormal];
    [self.moreBtn addTarget:self action:@selector(clickMore) forControlEvents:UIControlEventTouchUpInside];
    
    
}


- (void)setDataModel:(Case6Model *)dataModel{
    
    
    [self.titleLabel setText:dataModel.title];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        
        make.height.equalTo(@25);
    }];
    
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 10 * 2;
    [self.contentLabel setText:dataModel.content];
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        
#pragma mark 关键代码
        if(dataModel.expanded){
            make.bottom.equalTo(self.moreBtn.mas_top).with.offset(-4);
        }
        else{
            make.height.equalTo(@18);
        }
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentLabel.mas_bottom).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-4);
    }];
    
    
}

- (void)clickMore{
    
    NSLog(@"点击");
    
    
    self.clickMoreAction();
}




@end
