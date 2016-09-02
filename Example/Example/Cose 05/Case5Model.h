//
//  Case5Model.h
//  Example
//
//  Created by 白鹤 on 16/9/2.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "NHBaseModel.h"

@interface Case5Model : NHBaseModel

// 标题
@property (nonatomic, copy) NSString *title;

// 内容
@property (nonatomic, copy) NSString *content;

// 用户名称
@property (nonatomic, copy) NSString *username;

// 时间
@property (nonatomic, copy) NSString *time;

// 图片
@property (nonatomic, copy) NSString *imageName;

@end
