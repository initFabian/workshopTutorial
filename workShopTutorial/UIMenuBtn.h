//
//  UIMenuBtn.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "config.h"
@interface UIMenuBtn : UIBarButtonItem
-(void)IconAs:(FAIcon)icon;
-(void)IconAs:(FAIcon)icon withAction:(SEL)selector;
@end
