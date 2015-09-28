//
//  config.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#ifndef workShopTutorial_config_h
#define workShopTutorial_config_h

#import "NSString+FontAwesome.h"
#import "SWRevealViewController.h"
#import "ApiManager.h"
#import "UIMenuBtn.h"
#import "UIIconBtn.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "apiEndPoints.h"

//hex converter
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define APP_FONT @"AvenirNext-Light"

#define mainColor UIColorFromRGB(0x81d4dc)

#define mainComplementColor UIColorFromRGB(0x46898F)

#define subColor UIColorFromRGB(0xf04943)

#define statusBarColor UIStatusBarStyleLightContent

#define sideBarBackground UIColorFromRGB(0x3f3f3f)

//Colors
#define whiteColor UIColorFromRGB(0xffffff)
//TWITTER COLORS
#define twitterColor UIColorFromRGB(0x55acee)
#define twitterColorHighlighted UIColorFromRGB(0x4C9AD4)

#define twitterDark UIColorFromRGB(0x292f33)
#define twitterGrey UIColorFromRGB(0x66757f)
#define twitterLightGrey UIColorFromRGB(0xccd6dd)
#define twitterSuperLightGrey UIColorFromRGB(0xe1e8ed)



//FACEBOOK COLORS
#define facebookColor UIColorFromRGB(0x3b5998)
#define facebookColorHighlighted UIColorFromRGB(0x314A7E)

//LINKEDIN COLORS
#define linkedInColor UIColorFromRGB(0x0173b2)
#define linkedInColorHighlighted UIColorFromRGB(0x016398)
#endif
