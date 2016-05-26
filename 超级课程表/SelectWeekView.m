//
//  SelectWeekView.m
//  超级课程表
//
//  Created by 黄文海 on 16/5/26.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "SelectWeekView.h"
#import "Utils.h"
#import "weekCell.h"
@interface SelectWeekView()<UITableViewDataSource,UITableViewDelegate>{
    UITableView*table;
    CGFloat width ;
    CGFloat height ;

}
@end

@implementation SelectWeekView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        width = CGRectGetWidth(self.bounds);
        height = CGRectGetHeight(self.bounds);
        [self setUp];
    }
    return self;
}

-(void)setUp{
    table = [[UITableView alloc] initWithFrame:CGRectMake(6, 6,width-12 , height-12-40)];
    table.dataSource = self;
    table.delegate = self;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [table registerClass:[weekCell class] forCellReuseIdentifier:@"cell"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(6, height-50, width-12, 40);
    button.layer.borderColor = [Utils colorWithHexString:@"#eeeeee"].CGColor;
    button.layer.backgroundColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth=1;
    button.layer.cornerRadius=5;
    button.layer.masksToBounds =true;
    [button setTitle:@"修改当前周" forState:UIControlStateNormal];
    [button setTitleColor:[Utils colorWithHexString:@"#45e745"] forState:UIControlStateNormal];
    [self addSubview:table];
    [self addSubview:button];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    weekCell*cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.label.backgroundColor = [Utils colorWithHexString:@"#44acf3"];
    cell.label.textColor = [UIColor whiteColor];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    weekCell*cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.label.backgroundColor = [UIColor whiteColor];
    cell.label.textColor = [Utils colorWithHexString:@"#44acf3"];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    weekCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[weekCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.label.text = [NSString stringWithFormat:@"第%ld周",indexPath.row+1];
    return cell;
}

-(void)drawRect:(CGRect)rect{
        UIBezierPath*path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(9, 9) radius:4 startAngle:M_PI endAngle:M_PI/2*3 clockwise:1];
    [path moveToPoint:CGPointMake(9, 5)];
    [path addLineToPoint:CGPointMake((width-17)/2, 5)];
    [path addLineToPoint:CGPointMake((width-17)/2+4, 0)];
    [path addLineToPoint:CGPointMake((width-17)/2+8, 5)];
    [path addLineToPoint:CGPointMake(width-9,5)];
    [path addArcWithCenter:CGPointMake(width-9, 9) radius:4 startAngle:M_PI*3/2 endAngle:M_PI*2 clockwise:1];
    [path addLineToPoint:CGPointMake(width-5, height-9)];
    [path addArcWithCenter:CGPointMake(width-9, height-9) radius:4 startAngle:0 endAngle:M_PI/2.0 clockwise:1];
    [path addLineToPoint:CGPointMake(9, height-5)];
    [path addArcWithCenter:CGPointMake(9, height-9) radius:4 startAngle:M_PI/2 endAngle:M_PI clockwise:1];
    [path addLineToPoint:CGPointMake(5, 9)];
    [path closePath];
    UIColor *fillColor = [UIColor whiteColor];
    [fillColor set];
    [path fill];
    path.lineWidth =0.5 ;
    UIColor *strokeColor = [UIColor grayColor];
    [strokeColor set];
    [path stroke];

}

@end
