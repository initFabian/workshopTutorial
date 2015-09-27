//
//  UIMenuBtn.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "UIMenuBtn.h"

@implementation UIMenuBtn

- (void)awakeFromNib {
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: subColor,
                                 NSFontAttributeName: [UIFont fontWithName:kFontAwesomeFamilyName size:20.0f]
                                 };
    
    [self setTitleTextAttributes:attributes forState:UIControlStateNormal];

}

-(void)IconAs:(FAIcon)icon {
    self.title = [NSString fontAwesomeIconStringForEnum:icon];
}

-(void)IconAs:(FAIcon)icon withAction:(SEL)selector {
    self.title = [NSString fontAwesomeIconStringForEnum:icon];
    [self setAction:selector];
}
@end
