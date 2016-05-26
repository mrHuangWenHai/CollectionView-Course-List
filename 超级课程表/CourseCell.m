//
//  CourseCell.m
//  超级课程表
//
//  Created by 黄文海 on 16/5/24.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "CourseCell.h"
#import "Utils.h"

@implementation CourseCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self=[super initWithFrame:frame]){
        self.course = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, CGRectGetWidth(frame)-2, CGRectGetHeight(frame)-2)];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        _course.layer.cornerRadius = 5;
        _course.layer.masksToBounds =YES;
        [self addSubview:_course];
    }
    return self;
}

-(void)setModel:(CourseModel *)model{
    _model=model;
    _course.text = model.courseName;
    _course.font = [UIFont systemFontOfSize:13];
    _course.numberOfLines = 0;
    _course.backgroundColor = [UIColor redColor];
    if(![model.colors isEqualToString:@"#f5f5f5"])
    _course.textColor = [UIColor whiteColor];
    _course.alpha = 0.8;
    _course.backgroundColor = [Utils colorWithHexString:model.colors];
}

@end
