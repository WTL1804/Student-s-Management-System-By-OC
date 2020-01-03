//
//  deleteViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "delectDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface deleteViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property UITableView *tableView;
@property UITableView *studentTableView;
@property UIButton *deleteButton;
@property UITextField *xuehaoTextField;
@property NSMutableArray *deleteMutableArr;
@property NSObject<deleteDelegate>*delegate;
@end

NS_ASSUME_NONNULL_END
