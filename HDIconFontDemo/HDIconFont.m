//
//  HDIconFont.m
//  BitcoinTrade
//
//  Created by hundredlee on 6/9/16.
//  Copyright © 2016 Matrix Company. All rights reserved.
//

#import "HDIconFont.h"

@implementation HDIconFont{
    NSString *_fontPath;
    NSString *_fontName;
    NSDictionary *_fontString;
}

//实现单例
+ (HDIconFont *) instance
{
    static HDIconFont *instance = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void) initWithConfig:(NSDictionary *)config
{
    if (config[@(HDFontPath)]) {
        _fontPath = config[@(HDFontPath)];
    }
    if (config[@(HDFontName)]) {
        _fontName = config[@(HDFontName)];
    }
    if (config[@(HDFontString)]) {
        _fontString = config[@(HDFontString)];
    }
}

- (UIImage*) imageWithIcon:(NSString*)iconCode size:(NSUInteger)size color:(UIColor*)color {
    
    CGSize imageSize = CGSizeMake(size, size);
    // opaque：NO 不透明
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size, size)];
    label.font = [UIFont fontWithName:_fontName size:size];
    label.text = _fontString[iconCode];
    
    if(color){
        label.textColor = color;
    }
    [label setNumberOfLines:0];
    label.textAlignment = NSTextAlignmentCenter;
    // 渲染自身
    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    
    return image;
}



@end

UIImage *HDIconImageMake(NSString *iconCode,UIColor *color,CGFloat size)
{
    return [[HDIconFont instance] imageWithIcon:iconCode size:size color:color];
}