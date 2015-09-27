//
//  FeedCell.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FeedCell.h"
#import "config.h"

@implementation FeedCell
@synthesize userName,fullName,userImage,aboutText;
- (void)awakeFromNib {
    // Initialization code
    userImage.layer.backgroundColor=[[UIColor clearColor] CGColor];
    userImage.layer.cornerRadius = userImage.frame.size.width/2;
    userImage.layer.borderWidth = 2.0;
    userImage.layer.masksToBounds = YES;
    userImage.layer.borderColor = [subColor CGColor];
    fullName.textColor = twitterColor;
    userName.textColor = twitterGrey;
    aboutText.textColor = twitterDark;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
