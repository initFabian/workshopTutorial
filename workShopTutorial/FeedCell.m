//
//  FeedCell.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FeedCell.h"
//#import "config.h"

#warning FIX: Colors

@implementation FeedCell
@synthesize userName,fullName,userImage,aboutText;
- (void)awakeFromNib {
    // Initialization code
    userImage.layer.backgroundColor=[[UIColor clearColor] CGColor];
    userImage.layer.cornerRadius = userImage.frame.size.width/2;
    userImage.layer.borderWidth = 2.0;
    userImage.layer.masksToBounds = YES;


    userImage.layer.borderColor = [[UIColor colorWithRed:240.0/255.0 green:73.0/255.0 blue:67.0/255.0 alpha:1.0] CGColor]; //FIXME: [subColor CGColor];
    fullName.textColor = [UIColor colorWithRed:85.0/255.0 green:172.0/255.0 blue:238.0/255.0 alpha:1.0]; //FIXME: twitterColor
    userName.textColor = [UIColor colorWithRed:102.0/255.0 green:117.0/255.0 blue:127.0/255.0 alpha:1.0]; //FIXME: twitterGrey
    aboutText.textColor = [UIColor colorWithRed:41.0/255.0 green:47.0/255.0 blue:51.0/255.0 alpha:1.0]; //FIXME: twitterDark
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end
