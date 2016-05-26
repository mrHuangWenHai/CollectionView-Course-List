//
//  CouresCollectionViewLayout.m
//  超级课程表
//
//  Created by 黄文海 on 16/5/24.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "CouresCollectionViewLayout.h"
#import "CourseModel.h"
@implementation CouresCollectionViewLayout
struct Tag{
    NSInteger weekDay;
    NSInteger start;
    NSInteger end;
}tag;
-(void)prepareLayout{
}
-(CGSize)collectionViewContentSize{
    NSLog(@"%f",_height*12);
    return  CGSizeMake(self.collectionView.frame.size.width, _height*14);
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSLog(@"%f %f %f %f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
    NSMutableArray*attributes = [NSMutableArray array];
    CGFloat minY = CGRectGetMinY(rect);
    CGFloat maxY = CGRectGetMaxY(rect);
    CGFloat temp = _height;
    int tagMinY = 1;
    int  tagMaxY;
    while (minY>temp) {
        tagMinY++;
        temp+=_height;
    }
    tagMaxY = tagMinY;
    while(maxY>temp)
    {
        tagMaxY++;
        temp+=_height;
    }
    
    for(int i =tagMinY;i<=tagMaxY;i++)
    {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i-1 inSection:0];
        [attributes addObject:[self layoutAttributesForSupplementaryViewOfKind:@"number" atIndexPath:path]];
    }
    int j = 12;
    CourseModel*model;
    int p = 0;
    for(int i = tagMinY ;i<=tagMaxY;i++)
    {
        for(int k = p; k< _array.count ;k++)
        {
            model = _array[k];
            if(model.start == i || model.end == i)
            {

                NSIndexPath *path = [NSIndexPath indexPathForRow:j inSection:0];
                tag.weekDay = model.weekDay;
                tag.start = model.start;
                tag.end = model.end;
                [attributes addObject:[self layoutAttributesForItemAtIndexPath:path]];
                j++;
                p++;
            }
        }
    }
    
    
    
    
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes*attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(37+_width*(tag.weekDay-1),_height*(tag.start-1), _width, _height*(tag.end-tag.start+1));
    return attributes;
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes*attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    attributes.frame = CGRectMake(0, _height*indexPath.row, 37, _height);
    return attributes;
    
}


@end
