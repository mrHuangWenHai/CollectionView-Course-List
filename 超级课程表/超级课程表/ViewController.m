//
//  ViewController.m
//  超级课程表
//
//  Created by 黄文海 on 16/5/24.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"
#import "weekDay.h"
#import "CouresCollectionViewLayout.h"
#import "CourseCell.h"
#import "TagResuableView.h"
#import "CourseModel.h"
#import "SelectWeekView.h"
#import "Utils.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView*collection;
    CGFloat addWidth;
    NSArray*colors;
    SelectWeekView *s;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleView];
    
    
    colors = @[@"#1b83b4",@"#6d9525",@"#c58525",@"#4161b7",@"#af4271",@"#7053ab",@"#60a779",@"#cb5253"];
    [self setModel];
    addWidth= ([UIScreen mainScreen].bounds.size.width-30)/7.0;
    [self setWeekAndDays];
    CouresCollectionViewLayout*course = [[CouresCollectionViewLayout alloc] init];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon0.jpg"]];
    course.width = addWidth;
    course.height = (CGRectGetHeight([UIScreen mainScreen].bounds)-64-45)/9.7;
    course.array = _array;
    collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+45, CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetHeight([UIScreen mainScreen].bounds)) collectionViewLayout:course];
    collection.dataSource=self;
    collection.delegate=self;
    collection.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [collection registerClass:[CourseCell class] forCellWithReuseIdentifier:@"course"];
    [collection registerClass:[TagResuableView class] forSupplementaryViewOfKind:@"number" withReuseIdentifier:@"num"];
    collection.bounces = NO;
    [self.view addSubview:collection];
     s= [[SelectWeekView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100,64, 200, 250)];
     s.backgroundColor =[UIColor colorWithWhite:0 alpha:0];
    
    
}

-(void)setTitleView{
    UIButton*button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"第14周⬇︎" forState:UIControlStateNormal];
    [button setTitleColor:[Utils colorWithHexString:@"#44acf3"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popSelectView) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

-(void)popSelectView{
    static BOOL flag = false ;
    if(!flag){
        [self.view addSubview:s];
        flag = true;
    }
    else
    {
        [s removeFromSuperview];
        flag = false;
    }
}

-(void)setModel{
    self.array = [NSMutableArray array];
    CourseModel*model;
    int j=1;
    NSArray *te = @[@1,@2,@3,@4,@1,@2,@3,@4,@5,@1,@2,@3,@4,@5,@1,@2,@3,@5,@7];
    for(int i=1;i<=19;i++)
    {
        if(i>4&&i<=9) j=3;
        else
            if(i>9&&i<=14) j = 5;
            else
                if(i>14) j = 9;
        model = [[CourseModel alloc] init];
        model.end = j+1;
        NSInteger l = arc4random_uniform(7);
        model.colors = colors[l];
        if(i == 13 || i==14 || i==15) {model.end = j+3; model.colors = @"#f5f5f5";}
        if(i==18) model.end = j+2;
        model.start=j;
        model.weekDay = [te[i-1] intValue];
        model.courseName = @"计算机组成原理@三教C401";

        [_array addObject:model];
    }
}

-(void)setWeekAndDays{
    NSArray*weekStr = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;     comps = [calendar components:unitFlags fromDate:date];
    NSInteger week = [comps weekday]-1;
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    weekDay*flag;
    CGFloat height = 45;
    CGFloat x=37;
    NSInteger startDay = day - week+1;
    NSInteger startWeek = 0;
    flag = [[weekDay alloc] initWithFrame:CGRectMake(0, 64, 37, height)];
    flag.alpha=0.8;
    [flag setDay:[NSString stringWithFormat:@"%ld月",(long)month] week:@" "];
    [self.view addSubview:flag];
    for(int i=1;i<=7;i++)
    {
        x--;
        flag = [[weekDay alloc] initWithFrame:CGRectMake(x, 64, addWidth, height)];
        x+=addWidth;
        flag.alpha=0.9;

        [flag setDay:[NSString stringWithFormat:@"%ld",(long)startDay] week:weekStr[startWeek]];
        startDay++;
        startWeek++;
        
        [self.view addSubview:flag];
    }
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 31;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CourseCell*cell = [collection dequeueReusableCellWithReuseIdentifier:@"course" forIndexPath:indexPath];
    cell.model = _array[indexPath.row-12];
    return cell;
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    TagResuableView*Tag = [collectionView dequeueReusableSupplementaryViewOfKind:@"number" withReuseIdentifier:@"num" forIndexPath:indexPath];
    Tag.num.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    Tag.num.textColor = [UIColor whiteColor];
    return Tag;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
