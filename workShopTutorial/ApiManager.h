//
//  ApiConnect.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "config.h"

@interface ApiManager : NSObject {
    void (^_completionHandler)(NSError *err, NSMutableArray *response);
    void (^_dataHandler)(bool error, NSMutableArray *response);
}

- (void) getDataWithURL:(NSString *)urlString
         uponCompletion:(void(^)(NSError *err, NSMutableArray *response))handler;
@end
