//
//  FeedObj.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedObj : NSObject

@property(copy, nonatomic) NSString *username;
@property(copy, nonatomic) NSString *firstName;
@property(copy, nonatomic) NSString *lastName;
@property(copy, nonatomic) NSString *imageUrl;
@property(copy, nonatomic) NSString *aboutUser;
@property(copy, nonatomic) NSString *fullName;


- (id) initWithUserName:(NSString *)uName andFirstName:(NSString *)fName andLastName:(NSString *)lName andAbout:(NSString *)aboutText andImgURL:(NSString *)imgUrl;

@end
