//
//  Utils.m
//  GPCollectionView
//
//  Created by yintao on 15/5/19.
//  Copyright (c) 2015年 guangp. All rights reserved.
//

#import "Utils.h"

@implementation Utils
/**
 *  去掉字符串中得空格,看剩下的字符串的长度是否为零
 */
+(BOOL)stringIsAllSpace:(NSString *)string{
    //去掉字符串中得空格
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //看剩下的字符串的长度是否为零
    if ([temp length]==0)//由空格组成
    {
        return YES;
    }
    return NO;
}
/**
 * 云获取验证码失败
 *
 *  @param reason 错误代码
 *
 *  @return 对应消息
 */
+ (NSString *) onGetValiateCodeFailed:(NSInteger)reason
{
    NSString *tipString;
    switch (reason) {
        case 160021:
            tipString = @"相同的内容发给同一手机一天中只能发一次";
            break;
        case 160022:
            tipString = @"对不起，您今天的验证码发送次数超过上限，请明天再试";
            break;
            
        case 112314:
            tipString = @"对不起，您今天的验证码发送次数超过上限，请明天再试";
            break;
        case 172001:
            tipString=@"网络错误";
            break;
        default:
            tipString = @"验证码发送失败，请稍后再试";
            break;
    }
    
    return tipString;
}

#pragma mark - authCode
/**
 *  生成6位随机验证码
 *
 *  @return 验证码
 */
+ (NSString *)getRandomNumber{
    NSString *strRandom = @"";
    for(int i=0; i<6; i++)
    {
        //通过arc4random() 获取0到x-1之间的整数
        //(int)(from + (arc4random() % (to – from + 1)));
        int code=(int)(0 + (arc4random() % (9 - 0 + 1)));//+1,result is [from to];
        strRandom = [ strRandom stringByAppendingFormat:@"%i",code];
    }
    NSLog(@"strRandom:%@",strRandom);
    return strRandom;
}
/**
 *  字符串是否包含空格
 */
+(BOOL)stringContainsSpeace:(NSString *)string{
    NSArray *stringArray = [string componentsSeparatedByString:@" "];
    if (stringArray.count > 1) {
        return YES;
    }
    return NO;
}
/**
 *  手机号是否合法
 */
+(BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
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
+ (UIImageView *)circleImageWithName:(NSString *)name imgFrame:(CGRect)imageFrame borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
    [imageView setFrame:imageFrame];
    CGFloat imageW = imageView.frame.size.width;
    NSLog(@"%f",imageW);
    //告诉layer将位于它之下的layer都遮盖住
  imageView.layer.masksToBounds = YES;
    
    //设置layer的圆角,刚好是自身宽度的一半，这样就成了圆形
    imageView.layer.cornerRadius =imageW * 0.5;
    
    //设置边框的宽度为20
   imageView.layer.borderWidth =borderWidth;
    
    //设置边框的颜色
    imageView.layer.borderColor = borderColor.CGColor;
   
    return imageView;
}
/**
 *  date格式化为string
 *
 *  @param date  日期
 *  @param formate 日期格式
 *
 *  @return 返回格式化后的日期字符串
 */
+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//   formatter.timeZone=  [NSTimeZone timeZoneForSecondsFromGMT:0];//这就是GMT+0时区了
    [formatter setDateFormat:formate];
    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

/**
 *  string格式化为date，CST转GMT
 *
 *  @param datestring 日期字符串
 *  @param formate    日期格式
 *
 *  @return 返回日期
 */
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//   formatter.timeZone=  [NSTimeZone timeZoneForSecondsFromGMT:0];//这就是GMT+0时区了
    [formatter setDateFormat:formate];
    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}
+ (NSString*) stringFromFomate1:(NSDate*)date formate:(NSString*)formate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   formatter.timeZone=  [NSTimeZone timeZoneForSecondsFromGMT:0];//这就是GMT+0时区了
    [formatter setDateFormat:formate];
    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}
+ (NSDate *) dateFromFomate1:(NSString *)datestring formate:(NSString*)formate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
   formatter.timeZone=  [NSTimeZone timeZoneForSecondsFromGMT:0];//这就是GMT+0时区了
    [formatter setDateFormat:formate];
    formatter.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}
/**
 *  日期格式化,以上俩个合一了
 *
 *  @param datestring 日期字符串
 *
 *  @return 返回格式化后的日期字符串
 */
+ (NSString *)dateToString:(NSString *)datestring formate:(NSString*)formate{
    //Tue Jul 07 2015 09:42:09 GMT 0800 (CST)
    NSString *formate1 = @"E MMM dd yyyy HH:mm:ss 'GMT 0800 (CST)'";
    NSDate *createDate = [Utils dateFromFomate:datestring formate:formate1];
    NSLog(@"createDate:%@",createDate);
    NSString *text = [Utils stringFromFomate:createDate formate:formate];
    NSLog(@"%@",text);
    return text;

}
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
+(CGSize)textSize:(NSString *)text withFont:(CGFloat)font withFontName:(NSString *)fontName withWidth:(CGFloat)width withHeight:(CGFloat)height{
    if (!fontName) {
        fontName = @"HelveticaNeue";
    }
    if (font < 1) {
        font = 17;
    }
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:fontName size:font]};
    CGSize contentSize = [text boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return contentSize;
}
/**
 *  判断文字是否为空
 *
 *  @param string 字符串
 *
 *  @return 返回YES
 */
+ (BOOL)isNullOfInput:(NSString *)string{
    if ([string isEqual:[NSNull null]]||string==nil||[string isEqualToString:@""]) {
        return YES;
    }
    return NO;
}
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation
{
    UIImage *rorateImage = nil;
    switch (orientation) {
        case UIImageOrientationLeft:
            rorateImage = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationLeft];
            break;
        case UIImageOrientationRight:
            rorateImage = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationRight];
            break;
        case UIImageOrientationDown:
            rorateImage = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationDown];
            break;
        default:
            break;
    }
    CGSize size = CGSizeMake(rorateImage.size.width * rorateImage.scale, rorateImage.size.height * rorateImage.scale);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, CGRectMake(0, 0, size.width, size.height));
    
    [rorateImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *endImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return endImage;
}

+ (NSArray *)separatedString:(NSString *)str charactersInString:(NSString *)character{
    
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:character];
    
    NSArray *arr = [str componentsSeparatedByCharactersInSet:set];
    
    return arr;
    
}
+ (NSString *) stringDeleteString:(NSString *)str
{/*"[['川霸味道(这是一条测试商户数据，仅用于测试开发，开发完成后请申请正式数据...)','30.477997','114.41118','洪山区关山大道光谷天地2楼','5505744']]"*/
    NSMutableString *str1 = [NSMutableString stringWithString:str];
    //    [str1 deleteCharactersInRange: [str1 rangeOfString: @"''"]];
    for (int i = 0; i < str1.length; i++) {
        
        unichar c = [str1 characterAtIndex:i];
        NSRange range = NSMakeRange(i, 1);
        if (c == '\''|| c == '[') { //此处可以是任何字符
            [str1 deleteCharactersInRange:range];
            --i;
        }
    }
    NSString *newstr = [NSString stringWithString:str1];
    return newstr;
}
#pragma mark - IOS平台生成图片缩略图的两种方案
//1.自动缩放到指定大小
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        UIGraphicsBeginImageContext(asize);
        
        [image drawInRect:CGRectMake(0, 0, asize.width, asize.height)];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}
//2.保持原来的长宽比，生成一个缩略图
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
            
        }
        
        else{
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}
@end
