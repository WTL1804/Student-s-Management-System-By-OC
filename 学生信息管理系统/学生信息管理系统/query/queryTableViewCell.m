//
//  queryTableViewCell.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "queryTableViewCell.h"
#import "Student.h"
@implementation queryTableViewCell
- (void)copyInformation:(Student *)student{
    self.ageLabel.text = student.ageString;
    self.classLabel.text = student.classOfString;
    self.numberLabel.text = student.numberIDString;
    self.nameLabel.text = student.nameString;
    self.chineseLabel.text = student.chineseString;
    self.mathLabel.text = student.mathString;
    self.englishLabel.text = student.englishString;
    NSLog(@"拷贝完成");
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.ageLabel = [[UILabel alloc] init];
    self.classLabel = [[UILabel alloc] init];
    self.numberLabel = [[UILabel alloc] init];
    self.nameLabel = [[UILabel alloc] init];
    self.chineseLabel = [[UILabel alloc] init];
    self.mathLabel = [[UILabel alloc] init];
    self.englishLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.ageLabel];
    [self.contentView addSubview:self.classLabel];
    [self.contentView addSubview:self.numberLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.chineseLabel];
    [self.contentView addSubview:self.mathLabel];
    [self.contentView addSubview:self.englishLabel];
    
    self.ageNameLabel = [[UILabel alloc] init];
    self.classNameLabel = [[UILabel alloc] init];
    self.numberNameLabel = [[UILabel alloc] init];
    self.nameNameLabel = [[UILabel alloc] init];
    self.chineseNameLabel = [[UILabel alloc] init];
    self.mathNameLabel = [[UILabel alloc] init];
    self.englishNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.ageNameLabel];
    [self.contentView addSubview:self.classNameLabel];
    [self.contentView addSubview:self.numberNameLabel];
    [self.contentView addSubview:self.nameNameLabel];
    [self.contentView addSubview:self.chineseNameLabel];
    [self.contentView addSubview:self.mathNameLabel];
    [self.contentView addSubview:self.englishNameLabel];
    self.ageNameLabel.text = @"年龄:";
    self.classNameLabel.text = @"班级:";
    self.numberNameLabel.text = @"学号:";
    self.nameNameLabel.text = @"姓名:";
    self.chineseNameLabel.text = @"语文:";
    self.mathNameLabel.text = @"数学:";
    self.englishNameLabel.text = @"英语:";
    
    
    self.ageLabel.textAlignment = NSTextAlignmentCenter;
    self.classLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.chineseLabel.textAlignment = NSTextAlignmentCenter;
    self.mathLabel.textAlignment = NSTextAlignmentCenter;
    self.englishLabel.textAlignment = NSTextAlignmentCenter;
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.ageLabel.frame = CGRectMake(0, 0, 200, 60);
    self.classLabel.frame = CGRectMake(200, 0, 200, 60);
    self.numberLabel.frame = CGRectMake(0, 60, 200, 60);
    self.nameLabel.frame = CGRectMake(200, 60, 200, 60);
    self.chineseLabel.frame = CGRectMake(0, 120, 200, 60);
    self.mathLabel.frame = CGRectMake(200, 120, 200, 60);
    self.englishLabel.frame = CGRectMake(0, 180, 200, 60);
    
    
    self.ageNameLabel.frame = CGRectMake(0, 0, 60, 60);
    self.classNameLabel.frame = CGRectMake(200, 0, 60, 60);
    self.numberNameLabel.frame = CGRectMake(0, 60, 60, 60);
    self.nameNameLabel.frame = CGRectMake(200, 60, 60, 60);
    self.chineseNameLabel.frame = CGRectMake(0, 120, 60, 60);
    self.mathNameLabel.frame = CGRectMake(200, 120, 60, 60);
    self.englishNameLabel.frame = CGRectMake(0, 180, 60, 60);
}
@end
