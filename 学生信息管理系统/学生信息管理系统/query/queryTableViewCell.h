//
//  queryTableViewCell.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN

@interface queryTableViewCell : UITableViewCell
@property UILabel *ageLabel;
@property UILabel *classLabel;
@property UILabel *numberLabel;
@property UILabel *nameLabel;
@property UILabel *chineseLabel;
@property UILabel *mathLabel;
@property UILabel *englishLabel;
@property UILabel *ageNameLabel;
@property UILabel *classNameLabel;
@property UILabel *numberNameLabel;
@property UILabel *nameNameLabel;
@property UILabel *chineseNameLabel;
@property UILabel *mathNameLabel;
@property UILabel *englishNameLabel;


- (void)copyInformation:(Student *)student;
@end

NS_ASSUME_NONNULL_END
