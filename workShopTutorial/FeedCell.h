//
//  FeedCell.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *aboutText;

@end
