//
//  deleteViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "deleteViewController.h"
#import "queryTableViewCell.h"
#import "Student.h"
@interface deleteViewController ()

@end

@implementation deleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.frame;
    [imageView setImage:[UIImage imageNamed:@"IMG_3238.JPG"]];
    [self.view addSubview:imageView];
    //
    self.xuehaoTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 75, 270, 75)];
     self.xuehaoTextField.placeholder = @"请输入学号以删除";
    self.xuehaoTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 600, self.view.frame.size.width, self.view.frame.size.height-500) style:UITableViewStyleGrouped];
    UIImageView * viewBackeGround = [[UIImageView alloc] init];
    viewBackeGround.frame = self.view.frame;
    [viewBackeGround setImage:[UIImage imageNamed:@"IMG_3238.JPG"]];
    self.tableView.backgroundView = viewBackeGround;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.tableView.tag = 101;
    //查看学生信息
    self.studentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240) style:UITableViewStyleGrouped];
    self.studentTableView.tag =102;
    [self.view addSubview:self.studentTableView];
    //    self.studentTableView.backgroundView = viewBackeGround;
    self.studentTableView.delegate = self;
    self.studentTableView.dataSource = self;
    [self.studentTableView registerClass:[queryTableViewCell class] forCellReuseIdentifier:@"queCell"];
    //输入框，删除按钮
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteButton.frame = CGRectMake(160, 200, 100, 100);
    [self.deleteButton setImage:[UIImage imageNamed:@"icon-test-2.png"] forState:UIControlStateNormal];
    [self.tableView addSubview:self.deleteButton];
    [self.deleteButton addTarget:self action:@selector(pressdeleteButton) forControlEvents:UIControlEventTouchDown];
    [self.tableView addSubview:self.xuehaoTextField];
}
- (void)pressdeleteButton{
    for (int i = 0; i < self.deleteMutableArr.count; i++) {
        Student *student = self.deleteMutableArr[i];
        if ([self.xuehaoTextField.text isEqual: student.numberIDString]) {
            NSLog(@"%lu",(unsigned long)self.deleteMutableArr.count);
            [self.deleteMutableArr removeObjectAtIndex:i];
            [self.studentTableView reloadData];
            NSLog(@"%lu",(unsigned long)self.deleteMutableArr.count);
            [self.delegate deleteStudentDelegate:student];
            break;
        }
    
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 101){
        return 1;
    } else {
        NSLog(@"数值是%lu",(unsigned long)self.deleteMutableArr.count);
        return self.deleteMutableArr.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView     numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 102) {
        queryTableViewCell *cell = [self.studentTableView dequeueReusableCellWithIdentifier:@"queCell" forIndexPath:indexPath];
        Student *student = [[Student alloc] init];
        student = self.deleteMutableArr[indexPath.section];
        [cell copyInformation:student];
        
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 101) {
        return self.view.frame.size.height-600;
    } else  {
        return 240;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.xuehaoTextField resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
