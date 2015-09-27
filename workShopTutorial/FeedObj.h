//
//  FeedObj.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedObj : NSObject

@property(strong, nonatomic) NSString *username;
@property(strong, nonatomic) NSString *firstName;
@property(strong, nonatomic) NSString *lastName;
@property(strong, nonatomic) NSString *imageUrl;
@property(strong, nonatomic) NSString *aboutUser;
@property(strong, nonatomic) NSString *fullName;


- (id) initWithUserName:(NSString *)uName andFirstName:(NSString *)fName andLastName:(NSString *)lName andAbout:(NSString *)aboutText andImgURL:(NSString *)imgUrl;

@end
