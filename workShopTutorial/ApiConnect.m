//
//  ApiConnect.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import "ApiConnect.h"
#import "AFNetworking.h"

@implementation ApiConnect {
    AFHTTPRequestOperationManager *manager;
}

-(id) init {
    manager = [AFHTTPRequestOperationManager manager];
    return self;
}

/**
 *  Gets Data by setting Session with mySession and gets data with DataTaskFromSession:andRequest:withCallBack:
 *
 *  @param url String:
 *
 *  @return CallBack
 */
-(void)getDataWithURL:(NSString *)urlString uponCompletion:(void (^)(NSError *err, NSMutableArray *response))handler {
    _completionHandler = [handler copy];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id response) {
        _completionHandler(nil,response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        _completionHandler(error,nil);
    }];
}
@end
