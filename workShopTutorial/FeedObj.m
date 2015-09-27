//
//  FeedObj.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import "FeedObj.h"

@implementation FeedObj
@synthesize username,firstName,lastName,aboutUser,imageUrl,fullName;

- (id) initWithUserName:(NSString *)uName andFirstName:(NSString *)fName andLastName:(NSString *)lName andAbout:(NSString *)aboutText andImgURL:(NSString *)imgUrl {
    
    if (self = [self init]) {
        
        self.username = uName;
        self.firstName = fName;
        self.lastName = lName;
        self.fullName = [NSString stringWithFormat:@"%@ %@",fName,lName];
        self.imageUrl = imgUrl;
        self.aboutUser = aboutText;
    }
    return self;
}

@end
