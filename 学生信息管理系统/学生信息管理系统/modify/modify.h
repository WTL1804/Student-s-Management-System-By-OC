//
//  modify.h
//  学生信息管理系统
//
//  Created by 王天亮 on 2019/8/8.
//  Copyright © 2019 王天亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
NS_ASSUME_NONNULL_BEGIN
@protocol modifyDelegate <NSObject>

- (void)modify:(NSMutableArray *)array;

@end
@interface modify : NSObject

@end

NS_ASSUME_NONNULL_END
