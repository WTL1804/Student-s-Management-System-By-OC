//
//  ViewController.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "increase.h"
#import "Student.h"
#import "query/passinformation.h"
#import "delectDelegate.h"
#import "modify/modify.h"
@interface ViewController : UIViewController <increaseDelegate,passinformationDelegate,deleteDelegate,modifyDelegate>
@property UIButton *increase;
@property UIButton *deleteStudent;
@property UIButton *modify;
@property UIButton *query;
@property Student *exchangeStudent;
@property NSMutableArray *studentMutabelArr;

@end

