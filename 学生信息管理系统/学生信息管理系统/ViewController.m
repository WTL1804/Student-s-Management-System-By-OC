//
//  ViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "ViewController.h"
#import "queryViewController.h"
#import "increaseViewController.h"
#import "query/passinformation.h"
#import "delete/deleteViewController.h"
#import "modify/modifyViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
   // self.navigationController.navigationBar.hidden = YES;
   // self.tabBarController.tabBar.hidden = YES;
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.frame;
    [imageView setImage:[UIImage imageNamed:@"IMG_3236.JPG"]];
    [self.view addSubview:imageView];
    
    self.increase = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteStudent = [UIButton buttonWithType:UIButtonTypeCustom];
    self.modify = [UIButton buttonWithType:UIButtonTypeCustom];
    self.query = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.increase setTitle:@"增加学生信息" forState:UIControlStateNormal];
    [self.deleteStudent setTitle:@"删除学生信息" forState:UIControlStateNormal];
    [self.modify setTitle:@"修改学生信息" forState:UIControlStateNormal];
    [self.query setTitle:@"查询学生信息" forState:UIControlStateNormal];
    [self.increase setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.deleteStudent setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.modify setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.query setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.increase.frame = CGRectMake(75, 200, 270, 65);
    self.deleteStudent.frame = CGRectMake(75, 285, 270, 65);
    self.modify.frame = CGRectMake(75, 370, 270, 65);
    self.query.frame = CGRectMake(75, 455, 270, 65);
    [self.increase.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.deleteStudent.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.modify.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.query.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.increase.layer setBorderWidth:2];
     [self.deleteStudent.layer setBorderWidth:2];
     [self.modify.layer setBorderWidth:2];
     [self.query.layer setBorderWidth:2];
    self.increase.layer.cornerRadius = 10;
    self.deleteStudent.layer.cornerRadius = 10;
    self.modify.layer.cornerRadius = 10;
    self.query.layer.cornerRadius = 10;
    self.increase.titleLabel.font = [UIFont systemFontOfSize:24];
    self.deleteStudent.titleLabel.font = [UIFont systemFontOfSize:24];
    self.modify.titleLabel.font = [UIFont systemFontOfSize:24];
    self.query.titleLabel.font = [UIFont systemFontOfSize:24];
    
    [self.increase setBackgroundColor:[UIColor clearColor]];
    [self.deleteStudent setBackgroundColor:[UIColor clearColor]];
    [self.modify setBackgroundColor:[UIColor clearColor]];
    [self.query setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:self.increase];
    [self.view addSubview:self.deleteStudent];
    [self.view addSubview:self.modify];
    [self.view addSubview:self.query];
    
    [self.increase addTarget:self action:@selector(pressincrease) forControlEvents:UIControlEventTouchUpInside];
     [self.deleteStudent addTarget:self action:@selector(pressdelete) forControlEvents:UIControlEventTouchUpInside];
     [self.modify addTarget:self action:@selector(pressmodify) forControlEvents:UIControlEventTouchUpInside];
     [self.query addTarget:self action:@selector(pressquery) forControlEvents:UIControlEventTouchUpInside];
    
    self.studentMutabelArr = [[NSMutableArray alloc] init];
    NSLog(@"主页");
    
    
    //零时产生3个学生
    NSArray * array1 = @[@"18",@"17",@"16"];
    NSArray * array2 = @[@"软件1班",@"软件2班",@"软件3班"];
    NSArray * array3 = @[@"04183118",@"04183221",@"04213132"];
    NSArray * array4 = @[@"王天亮",@"吴彦祖",@"卢本伟"];
    NSArray * array5 = @[@"99",@"88",@"77"];
    NSArray * array6 = @[@"100",@"98",@"97"];
    NSArray * array7 = @[@"100",@"99",@"98"];
    for (int i = 0; i < 3; i++) {
    Student * stu = [[Student alloc] init];
        stu.ageString = array1[i];
        stu.classOfString = array2[i];
        stu.numberIDString = array3[i];
         stu.nameString = array4[i];
         stu.chineseString = array5[i];
         stu.mathString = array6[i];
         stu.englishString = array7[i];
        [self.studentMutabelArr addObject:stu];
    }
    
}
- (void)pressincrease {
    increaseViewController *increase = [[increaseViewController alloc] init];
    increase.delegate = self;
    increase.repeatMutableArr = [self.studentMutabelArr mutableCopy];
//    for (int i = 0; i < self.studentMutabelArr.count; i++) {
//        Student *student = self.studentMutabelArr[i];
//        NSLog(@"%@",student.nameString);
//    }
    NSLog(@"进入增加界面");
    [self.navigationController pushViewController:increase animated:YES];
}
- (void)pressdelete {
    deleteViewController * delete = [[deleteViewController alloc] init];
    delete.delegate =self;
    delete.deleteMutableArr = [self.studentMutabelArr mutableCopy];
    [self.navigationController pushViewController:delete animated:YES];
}
- (void)pressmodify {
    modifyViewController *modify = [[modifyViewController alloc] init];
    modify.detegate = self;
    modify.repeatMutableArr = [self.studentMutabelArr mutableCopy];
    [self.navigationController pushViewController:modify animated:YES];
    
}
- (void)pressquery {
    queryViewController *query = [[queryViewController alloc] init];
    query.delegate = self;
    query.studentSet = [self.studentMutabelArr mutableCopy];
    [self.navigationController pushViewController:query animated:YES];
}
- (void)increase:(Student *)student {
    [self.studentMutabelArr addObject:student];
    NSLog(@"从增加界面传值完成");
    [self.view reloadInputViews];
}
- (void)passinformation:(Student *)student {
    [self.studentMutabelArr addObject:student];
    NSLog(@"从查询界面传值完成");
    [self.view reloadInputViews];
}
- (void)deleteStudentDelegate:(Student *)student {
    [self.studentMutabelArr removeObject:student];
    NSLog(@"从删除界面传值完成");
    [self.view reloadInputViews];
}
- (void)modify:(NSMutableArray *)array {
    NSLog(@"从修改界面传值完成");
    self.studentMutabelArr = [array mutableCopy];
    [self.view reloadInputViews];
}

@end
