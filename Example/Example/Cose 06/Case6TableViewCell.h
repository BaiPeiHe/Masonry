//
//  Case6TableViewCell.h
//  Example
//
//  Created by 白鹤 on 16/9/5.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Case6Model.h"

@interface Case6TableViewCell : UITableViewCell

@property (nonatomic, strong)Case6Model *dataModel;

@property (nonatomic, copy)void(^clickMoreAction)();

@end
