//
//  queryViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "passinformation.h"
NS_ASSUME_NONNULL_BEGIN

@interface queryViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@property NSInteger studentnumber;
@property Student *informationStudent;
@property NSObject <passinformationDelegate>*delegate;
@property NSMutableArray *studentSet;
@property UITextField *queryTextField;

@end

NS_ASSUME_NONNULL_END
