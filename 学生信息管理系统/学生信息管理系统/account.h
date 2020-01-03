//
//  account.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/7.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class account;
@protocol PassAccountDelegate <NSObject>

-(void)passAccount:(account *)account;

@end
@interface account : NSObject
@property NSString *str1;
@property NSString *str2;

@end

NS_ASSUME_NONNULL_END
