//
//  Case5TableViewCell.m
//  Example
//
//  Created by 白鹤 on 16/9/2.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case5TableViewCell.h"
#import "UILabel+ContentSize.h"

@interface Case5TableViewCell ()

// 标题
@property (nonatomic, strong)UILabel *titleLabel;

// 内容
@property (nonatomic, strong)UILabel *contentLabel;

// 图片
@property (nonatomic, strong)UIImageView *picView;

// 用户名
@property (nonatomic, strong)UILabel *nameLabe;

// 时间
@property (nonatomic, strong)UILabel *timeLabel;


@end

@implementation Case5TableViewCell

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
    self.titleLabel.font = [UIFont systemFontOfSize:20];
    
    self.contentLabel = [UILabel new];
    [self.contentView addSubview:self.contentLabel];
    
    self.picView = [UIImageView new];
    [self.contentView addSubview:self.picView];
    
    self.nameLabe = [UILabel new];
    [self.contentView addSubview:self.nameLabe];
    
    self.timeLabel = [UILabel new];
    [self.contentView addSubview:self.timeLabel];
    
    
}


- (void)setDataModel:(Case5Model *)dataModel{
    
    // 标题 - 单行
    [self.titleLabel setText:dataModel.title];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 上,左,右
        make.top.equalTo(self.contentView.mas_top).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        
        make.bottom.equalTo(self.contentLabel.mas_top).with.offset(-4);
        
        // 固定高度
        make.height.equalTo(@25);
    }];
    
    // 内容 - 多行
    // 宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 10 * 2;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.preferredMaxLayoutWidth = preferredMaxWidth;
    [self.contentLabel setText:dataModel.content];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-10);
        
        make.bottom.equalTo(self.picView.mas_top).with.offset(-4);
    }];
    // 设置高度的 content Hugging
    [self.contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    NSString *picName = [NSString stringWithFormat:@"%@",dataModel.imageName];
    [self.picView setImage:[UIImage imageNamed: picName]];
    
    [self.picView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentLabel.mas_bottom).with.offset(4);
        
        make.left.equalTo(self.contentView.mas_left).with.offset(10);
        // 限制宽度,不超过屏幕
        make.width.mas_lessThanOrEqualTo(self.contentView.frame.size.width - 20);
        
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-10);
    }];
    
    // 设置高度的 content Hugging
    [self.imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
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
