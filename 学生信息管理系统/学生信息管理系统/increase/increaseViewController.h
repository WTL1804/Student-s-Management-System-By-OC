//
//  increaseViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "increase.h"
NS_ASSUME_NONNULL_BEGIN

@interface increaseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property NSObject<increaseDelegate>*delegate;
@property UITextField *ageTextField;
@property UITextField *classTextField;
@property UITextField *numberIDTextField;
@property UITextField *nameTextField;
@property UITextField *chineseTextField;
@property UITextField *mathTextField;
@property UITextField *englishTextField;
@property UIButton *zhuceBtn;
@property NSMutableArray *repeatMutableArr;
@property UILabel *label;
@property UITableView *tableView;
@property UITableView *studentTableView;

@end

NS_ASSUME_NONNULL_END
