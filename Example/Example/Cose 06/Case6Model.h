//
//  Case6Model.h
//  Example
//
//  Created by 白鹤 on 16/9/5.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "NHBaseModel.h"

@interface Case6Model : NHBaseModel

// 标题
@property (nonatomic, copy) NSString *title;

// 内容
@property (nonatomic, copy) NSString *content;

// 是否修改状态
@property (nonatomic, assign) BOOL expanded;

@end
