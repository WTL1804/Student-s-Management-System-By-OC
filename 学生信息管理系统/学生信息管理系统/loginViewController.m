//
//  loginViewController.m
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import "loginViewController.h"
#import "zhuceViewController.h"
#import "ViewController.h"
@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_3251.JPG"]];
    self.headImageView.frame = CGRectMake(180, 175, 75, 75);
    [self.view addSubview:_headImageView];
    self.headImageView.layer.cornerRadius = 75/2;
    self.headImageView.clipsToBounds = YES;
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    self.username = [[UITextField alloc] initWithFrame:CGRectMake(75, 275, 270, 75)];
    
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(75, 400, 270, 75)];
    
    self.username.borderStyle = UITextBorderStyleRoundedRect;
    self.password.borderStyle = UITextBorderStyleRoundedRect;
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(160, 500, 100, 100);
    [self.loginBtn setImage:[UIImage imageNamed:@"icon-test.png"] forState:UIControlStateNormal];
    self.loginBtn.layer.cornerRadius = 10;
    self.password.layer.cornerRadius = 10;
    self.username.placeholder = @"请输入账号";
    self.password.placeholder = @"请输入密码";
    self.zhuceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zhuceBtn.frame = CGRectMake(140, 700, 150, 30);
    [self.zhuceBtn setTitle:@"没有账号？点击注册" forState:UIControlStateNormal];
    [self.zhuceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.zhuceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.zhuceBtn addTarget:self action:@selector(presszhuce:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn addTarget:self action:@selector(presslogin:) forControlEvents:UIControlEventTouchUpInside];
    
    self.accountarray = [[NSMutableArray alloc] init];
    self.passwordarray = [[NSMutableArray alloc] init];
    self.label = [[UILabel alloc] init];
    self.label.text = @"   账号或密码错误";
    self.label.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
    self.label.alpha = 0;
    self.label.frame = CGRectMake(140, 630, 150, 50);
    [self.view addSubview:self.label];
    [self.view addSubview:self.username];
    [self.view addSubview:self.password];
    [self.view addSubview:self.zhuceBtn];
    [self.view addSubview:self.loginBtn];
    
}
- (void)presslogin:(UIButton *)btn {
    int flag = 0;
    for (int i = 0; i < self.passwordarray.count; i++) {
        if ([self.username.text isEqual:self.accountarray[i]] && [self.password.text isEqual:self.passwordarray[i]]) {
            flag++;
            break;
        }
    }
    if (flag == 0) {
        [UIView animateWithDuration:1.5 animations:^{
            self.label.alpha = 0.8;
        }];
        [UIView animateWithDuration:1 animations:^{
            self.label.alpha = 0;
        }];
    } else {
        ViewController * view = [[ViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }
    

}
- (void)presszhuce:(UIButton *)btn{
    zhuceViewController *zhuce = [[zhuceViewController alloc] init];
    zhuce.delegate = self;
    zhuce.repeat = self.accountarray;
    [self.navigationController pushViewController:zhuce animated:YES];
}
- (void)passAccount:(account *)account {
    self.username.text = account.str1;
    self.password.text = account.str2;
    [self.accountarray addObject:account.str1];
    [self.passwordarray addObject:account.str2];
    [self.view reloadInputViews];

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
