//
//  modifyViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "modify.h"
NS_ASSUME_NONNULL_BEGIN

@interface modifyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property NSObject <modifyDelegate>*detegate;
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
@property UIButton *backButton;
@property UITextField *inputTextField;
@property BOOL flage;
@property Student *flagStudent;
@property NSInteger location;
@end

NS_ASSUME_NONNULL_END
