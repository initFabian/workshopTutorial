//
//  Colors.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/28/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#ifndef Colors_h
#define Colors_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]    //hex converter


#define baseColor UIColorFromRGB(0x81d4dc)

#define baseComplementColor UIColorFromRGB(0x46898F)

#define subColor UIColorFromRGB(0xf04943)

#define sideBarBackground UIColorFromRGB(0x3f3f3f)

//Colors
#define whiteColor UIColorFromRGB(0xffffff)

//TWITTER COLORS link: https://about.twitter.com/company/brand-assets
#define twitterColor UIColorFromRGB(0x55acee)
#define twitterDark UIColorFromRGB(0x292f33)
#define twitterGrey UIColorFromRGB(0x66757f)
#define twitterLightGrey UIColorFromRGB(0xccd6dd)

//FACEBOOK COLORS
#define facebookColor UIColorFromRGB(0x3b5998)

//LINKEDIN COLORS
#define linkedInColor UIColorFromRGB(0x0173b2)

#endif /* Colors_h */
