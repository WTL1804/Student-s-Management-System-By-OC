//
//  modifyViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "modifyViewController.h"
#import "queryTableViewCell.h"
@interface modifyViewController ()

@end

@implementation modifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.frame;
    [imageView setImage:[UIImage imageNamed:@"IMG_3239.JPG"]];
    [self.view addSubview:imageView];
  //  self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 75, 270, 75)];
    self.classTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 175, 270, 75)];
    self.numberIDTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 275, 270, 75)];
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 375, 270, 75)];
    self.chineseTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 475, 270, 75)];
    self.mathTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 575, 270, 75)];
    self.englishTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 675, 270, 75)];
    self.inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(75, 320, 270, 75)];
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
    [rightView setImage:[UIImage imageNamed:@"xia.png"]];
    rightView.userInteractionEnabled =YES;
    self.inputTextField.rightView = rightView;
    [self.inputTextField addTarget:self action:@selector(endEdit) forControlEvents:UIControlEventEditingDidEnd];
    self.inputTextField.placeholder = @"请输入学号以删除";
    self.inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.classTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberIDTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.chineseTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.mathTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.englishTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.ageTextField.placeholder = @"请输入年龄";
    self.classTextField.placeholder = @"请输入班级";
    self.numberIDTextField.placeholder = @"请输入学号";
    self.nameTextField.placeholder = @"请输入姓名";
    self.chineseTextField.placeholder = @"请输入语文成绩";
    self.mathTextField.placeholder = @"请输入数学成绩";
    self.englishTextField.placeholder = @"请输入英语成绩";
    self.inputTextField.placeholder=@"输入学号以修改";
    
    
    
    self.zhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zhuceBtn.frame = CGRectMake(160, 770, 100, 100);
    [self.zhuceBtn setImage:[UIImage imageNamed:@"icon-test-2.png"] forState:UIControlStateNormal];
    
    [self.zhuceBtn addTarget:self action:@selector(presszhuce) forControlEvents:UIControlEventTouchDown];
    self.label = [[UILabel alloc] init];
    self.label.text = @"   查无此人，请输入正确的学号";
    self.label.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
    self.label.alpha = 0;
    self.label.frame = CGRectMake(140, 630, 150, 50);
    [self.view addSubview:self.label];
    
    
    
    //增加学生信息
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, self.view.frame.size.height-400) style:UITableViewStyleGrouped];
    UIImageView * viewBackeGround = [[UIImageView alloc] init];
    viewBackeGround.frame = self.view.frame;
    [viewBackeGround setImage:[UIImage imageNamed:@"IMG_3239.JPG"]];
    self.tableView.backgroundView = viewBackeGround;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.ageTextField];
    [self.tableView addSubview:self.classTextField];
    [self.tableView addSubview:self.numberIDTextField];
    [self.tableView addSubview:self.nameTextField];
    [self.tableView addSubview:self.chineseTextField];
    [self.tableView addSubview:self.mathTextField];
    [self.tableView addSubview:self.englishTextField];
    [self.tableView addSubview:self.zhuceBtn];
    [self.tableView addSubview:self.label];
    [self.view addSubview:self.inputTextField];
    self.tableView.tag = 101;
    //查看学生信息
    self.studentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240) style:UITableViewStyleGrouped];
    self.studentTableView.tag =102;
    [self.view addSubview:self.studentTableView];
    //    self.studentTableView.backgroundView = viewBackeGround;
    self.studentTableView.delegate = self;
    self.studentTableView.dataSource = self;
    [self.studentTableView registerClass:[queryTableViewCell class] forCellReuseIdentifier:@"queCell"];
    self.flage = NO;

}
- (void)endEdit {
    for (int i = 0; i < self.repeatMutableArr.count; i++) {
        self.flagStudent = self.repeatMutableArr[i];
        if ([self.inputTextField.text isEqual:self.flagStudent.numberIDString]) {
            self.location = i;
            self.ageTextField.text = self.flagStudent.ageString;
            self.classTextField.text = self.flagStudent.classOfString;
            self.numberIDTextField.text = self.flagStudent.numberIDString;
            self.nameTextField.text = self.flagStudent.nameString;
            self.chineseTextField.text = self.flagStudent.chineseString;
            self.mathTextField.text = self.flagStudent.mathString;
            self.englishTextField.text = self.flagStudent.englishString;
            self.flage = YES;
            [self.tableView reloadData];
            break;
        }
    }
    if (self.flage == NO) {
        [UIView animateWithDuration:2 animations:^{
            self.label.alpha = 1;
        }];
        [UIView animateWithDuration:2 animations:^{
            self.label.alpha = 0;
        }];
    }

}
- (void)presszhuce {
    [self.repeatMutableArr removeObject:self.flagStudent];
    self.flagStudent.ageString = self.ageTextField.text;
    self.flagStudent.classOfString = self.classTextField.text;
    self.flagStudent.numberIDString = self.numberIDTextField.text;
    self.flagStudent.nameString = self.nameTextField.text;
    self.flagStudent.chineseString = self.chineseTextField.text;
    self.flagStudent.mathString = self.mathTextField.text;
    self.flagStudent.englishString = self.englishTextField.text;
        [self.repeatMutableArr insertObject:self.flagStudent atIndex:self.location];
        [self.detegate modify:self.repeatMutableArr];
        [self.studentTableView reloadData];
        //       [self.navigationController popViewControllerAnimated:YES];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.ageTextField resignFirstResponder];
    [self.classTextField resignFirstResponder];
    [self.numberIDTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.chineseTextField resignFirstResponder];
    [self.mathTextField resignFirstResponder];
    [self.englishTextField resignFirstResponder];
    [self.inputTextField resignFirstResponder];
    
}
//tableView的协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView.tag == 101){
        return 1;
    } else {
        return self.repeatMutableArr.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView     numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 102) {
        queryTableViewCell *cell = [self.studentTableView dequeueReusableCellWithIdentifier:@"queCell" forIndexPath:indexPath];
        Student *student = [[Student alloc] init];
        student = self.repeatMutableArr[indexPath.section];
        [cell copyInformation:student];
        
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 101) {
        return self.view.frame.size.height;
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.ageTextField resignFirstResponder];
    [self.classTextField resignFirstResponder];
    [self.numberIDTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.chineseTextField resignFirstResponder];
    [self.mathTextField resignFirstResponder];
    [self.englishTextField resignFirstResponder];
    [self.inputTextField resignFirstResponder];
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
