//
//  AutoHightTableViewCell.m
//  Example
//
//  Created by 白鹤 on 16/8/31.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "AutoHightTableViewCell.h"

@interface AutoHightTableViewCell ()

// 头像
@property (nonatomic, strong)UIButton *avatarBtn;

// 标题
@property (nonatomic, strong)UILabel *titleLabel;

// 内容
@property (nonatomic, strong)UILabel *contentLabel;

@end

@implementation AutoHightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        [self createView];
    }
    return self;
}

- (void)createView{
    
    // 头像
    self.avatarBtn = [UIButton new];
    [self.contentView addSubview:self.avatarBtn];
    
    [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        // 左上固定
        make.top.equalTo(self.contentView.mas_top).with.offset(4);
        make.left.equalTo(self.contentView.mas_left).with.offset(4);
        // 宽度、高度固定
        make.width.and.height.equalTo(@44);
        
    }];
    
    // 标题 - 单行
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).with.offset(4);
        
        make.left.equalTo(self.avatarBtn.mas_right).with.offset(4);
        make.right.equalTo(self.contentView.mas_right).with.offset(4);
        
        make.height.equalTo(@22);
    }];
    
    
    // 内容 - 多行
    // 计算 Label 的宽度
    // 计算 Label 的 preferredMaxLayoutWidth的值,多行时必须设置这个值,否则系统无法决定Label 的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - (16 + 4) * 2 - 40 - 4;
    
    self.contentLabel = [UILabel new];
    [self.contentView addSubview:self.contentLabel];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = preferredMaxWidth;
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(4);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(4);
        
        make.left.equalTo(self.avatarBtn.mas_right).with.offset(4);
        make.right.equalTo(self.contentView.mas_right).with.offset(4);
        
    }];
    
    // 设置高度的 content Hugging
    [self.contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
}

- (void)setTitle:(NSString *)title Content:(NSString *)content{
    
    self.avatarBtn.backgroundColor = [UIColor colorWithRed: (CGFloat)random()/(CGFloat)RAND_MAX green: (CGFloat)random()/(CGFloat)RAND_MAX blue: (CGFloat)random()/(CGFloat)RAND_MAX alpha:1];
    
    self.titleLabel.text = title;
    self.contentLabel.text = content;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
