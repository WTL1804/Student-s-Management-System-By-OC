//
//  zhuceViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "account.h"
NS_ASSUME_NONNULL_BEGIN

@interface zhuceViewController : UIViewController
@property NSObject <PassAccountDelegate>*delegate;
@property UITextField *username;
@property UITextField *password;
@property UIButton *zhuceBtn;
@property NSMutableArray *repeat;
@property UILabel *label;
@end

NS_ASSUME_NONNULL_END
