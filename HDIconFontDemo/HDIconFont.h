//
//  HDIconFont.h
//  BitcoinTrade
//
//  Created by hundredlee on 6/9/16.
//  Copyright © 2016 Matrix Company. All rights reserved.
//

#import <UIKit/UIKit.h>

UIImage *HDIconImageMake(NSString *iconCode,UIColor *color,CGFloat size);

@interface HDIconFont : NSObject

typedef NS_ENUM(NSInteger,HDIconConfigKey){
    HDFontPath,
    HDFontName,
    HDFontString,
};

+ (HDIconFont *) instance;

- (void) initWithConfig:(NSDictionary *)config;

@end
