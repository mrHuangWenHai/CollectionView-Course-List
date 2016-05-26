//
//  CourseModel.h
//  超级课程表
//
//  Created by 黄文海 on 16/5/25.
//  Copyright © 2016年 huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseModel : NSObject
@property(nonatomic,copy)NSString*courseName;
@property(nonatomic,strong)NSString*colors;
@property(nonatomic,assign)NSInteger weekDay;
@property(nonatomic,assign)NSInteger end;
@property(nonatomic,assign)NSInteger start;
@end
