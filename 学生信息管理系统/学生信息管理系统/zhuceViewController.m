//
//  zhuceViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "zhuceViewController.h"
#import "account.h"

@interface zhuceViewController ()

@end

@implementation zhuceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.username = [[UITextField alloc] initWithFrame:CGRectMake(75, 275, 270, 75)];
    self.username.placeholder = @"请输入账号";
   
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(75, 400, 270, 75)];
    self.password.placeholder = @"请输入密码";
    self.password.layer.cornerRadius = 10;
    self.username.borderStyle = UITextBorderStyleRoundedRect;
    self.password.borderStyle = UITextBorderStyleRoundedRect;
    
    self.zhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zhuceBtn.frame = CGRectMake(160, 500, 100, 100);
    [self.zhuceBtn setImage:[UIImage imageNamed:@"icon-test-2.png"] forState:UIControlStateNormal];
    
    [self.zhuceBtn addTarget:self action:@selector(presszhuce:) forControlEvents:UIControlEventTouchUpInside];
    self.label = [[UILabel alloc] init];
    self.label.text = @"   账号已经存在";
    self.label.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
    self.label.alpha = 0;
    self.label.frame = CGRectMake(140, 630, 150, 50);
    [self.view addSubview:self.label];
    
    [self.view addSubview:self.username];
    [self.view addSubview:self.password];
    [self.view addSubview:self.zhuceBtn];
    
}
- (void)presszhuce:(UIButton *)btn{
    int flag= 0;
    for (int i = 0; i < self.repeat.count; i++) {
        if ([self.username.text isEqual:self.repeat[i]]) {
            flag++;
        }
    }
    if (flag == 0){
        account * act = [[account alloc] init];
        act.str1 = self.username.text;
        act.str2 = self.password.text;
        [self.delegate passAccount:act];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [UIView animateWithDuration:1.5 animations:^{
            self.label.alpha = 0.8;
        }];
        [UIView animateWithDuration:1 animations:^{
            self.label.alpha = 0;
        }];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    
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
