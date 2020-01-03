//
//  queryViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "queryViewController.h"
#import "queryTableViewCell.h"
#import "Student.h"
@interface queryViewController ()

@end

@implementation queryViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [imageView setImage:[UIImage imageNamed:@"IMG_3237.JPG"]];
    [self.view addSubview:imageView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height -400) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    //self.tableView.backgroundView = imageView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[queryTableViewCell class] forCellReuseIdentifier:@"queCell"];
    self.studentnumber = 3;
    self.informationStudent = [[Student alloc] init];
    
    self.queryTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 240, 240, 75)];
    self.queryTextField.placeholder = @"输入学号以查询";
    self.queryTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.queryTextField];
    [self.queryTextField addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
    //学生
}
- (void)endEdit {
    for (int i = 0; i < self.studentSet.count; i++) {
        Student * student = self.studentSet[i];
        if ([student.numberIDString isEqual:self.queryTextField.text]) {
            [self.tableView setContentOffset:CGPointMake(0, i*240)];
//            [self.tableView reloadData];
        }
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.studentSet.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    queryTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"queCell" forIndexPath:indexPath];
    self.informationStudent = [[Student alloc] init];
    self.informationStudent = self.studentSet[indexPath.section];
    [cell copyInformation:self.informationStudent];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.queryTextField resignFirstResponder];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.queryTextField resignFirstResponder];
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
