//
//  UICustomButton.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/29/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface UICustomButton : UIButton
-(void)SocialMediaBtnWithIcon:(FAIcon)icon andTitle:(NSString *)title andColor:(id)color;
-(void)CircleBtnWithIcon:(FAIcon)icon;

@end
