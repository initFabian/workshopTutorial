//
//  UIIconBtn.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"

@interface UIIconBtn : UIButton
@property (nonatomic, strong) CAShapeLayer *circleLayer;
-(void)SocialMediaBtnWithIcon:(FAIcon)icon andTitle:(NSString *)title andColor:(id)color;
-(void)CircleBtnWithIcon:(FAIcon)icon;
@end
