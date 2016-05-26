//
//  Utils.h
//  GPCollectionView
//
//  Created by yintao on 15/5/19.
//  Copyright (c) 2015年 guangp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  定义一些常用方法
 */
@interface Utils : NSObject
/**
 *  去掉字符串中得空格,看剩下的字符串的长度是否为零
 */
+(BOOL)stringIsAllSpace:(NSString *)string;
/**
 * 云获取验证码失败
 *
 *  @param reason 错误代码
 *
 *  @return 对应消息
 */
+ (NSString *) onGetValiateCodeFailed:(NSInteger)reason;
/**
 *  生成6位随机验证码
 *
 *  @return 验证码
 */
+ (NSString *)getRandomNumber;
/**
 *  字符串是否包含空格
 */
+(BOOL)stringContainsSpeace:(NSString *)string;
/**
 *  手机号是否合法
 */
+(BOOL)isValidateMobile:(NSString *)mobile;
/**
 *  把图片切割成圆形
 *
 *  @param name        图片名称
 *  @param imageFrame  图片frame
 *  @param borderWidth 图片边框宽度
 *  @param borderColor 图片边框颜色
 *
 *  @return 返回图片对象
 */
+ (UIImageView *)circleImageWithName:(NSString *)name imgFrame:(CGRect)imageFrame borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  date格式化为string
 *
 *  @param date  日期
 *  @param formate 日期格式
 *
 *  @return 返回格式化后的日期字符串
 */
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;
/**
 *  string格式化为date
 *
 *  @param datestring 日期字符串
 *  @param formate    日期格式
 *
 *  @return 返回日期
 */
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;
+ (NSString*) stringFromFomate1:(NSDate*)date formate:(NSString*)formate;
+ (NSDate *) dateFromFomate1:(NSString *)datestring formate:(NSString*)formate;
/**
 *  日期格式化,以上俩个合一了
 *  @param formate    日期格式
 *  @param datestring 日期字符串
 *
 *  @return 返回格式化后的日期字符串
 */
+ (NSString *)dateToString:(NSString *)datestring formate:(NSString*)formate;
/**
 *  根据指定的字体类型、size，计算绘制文本所需要的Size
 *
 *  @param text     文本
 *  @param font     文本字体大小
 *  @param fontName 字体名字
 *  @param width    字体宽度
 *  @param height   字体高度
 *
 *  @return 返回文本Size
 */
+(CGSize)textSize:(NSString *)text withFont:(CGFloat)font withFontName:(NSString *)fontName withWidth:(CGFloat)width withHeight:(CGFloat)height;
/**
 *  判断文字是否为空
 *
 *  @param string 字符串
 *
 *  @return 返回YES
 */
+ (BOOL)isNullOfInput:(NSString *)string;
//颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color;
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;
+ (NSArray *)separatedString:(NSString *)str charactersInString:(NSString *)character;
+ (NSString *) stringDeleteString:(NSString *)str;
//截取图片,生成图片缩略图的两种方案
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize;
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
@end
