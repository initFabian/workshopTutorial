//
//  UIIconBtn.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "UIIconBtn.h"

@implementation UIIconBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    self.tintColor = whiteColor;
    self.backgroundColor = mainComplementColor;

}
-(void)CircleBtnWithIcon:(FAIcon)icon {
    self.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 60.0f/2.0f;
    self.layer.borderColor = self.titleLabel.textColor.CGColor;
    
    [self setTitle:[NSString fontAwesomeIconStringForEnum:icon] forState:UIControlStateNormal];
}
-(void)SocialMediaBtnWithIcon:(FAIcon)icon andTitle:(NSString *)title andColor:(id)color {
    self.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [self setTitle:[NSString
                    stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:icon],title]
          forState:UIControlStateNormal];
    [self setTitleColor:whiteColor forState:UIControlStateHighlighted];
    [self setBackgroundColor:color];

}



@end
