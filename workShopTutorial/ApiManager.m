//
//  ApiConnect.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/17/15.
//  Copyright (c) 2015 Fabian Buentello. All rights reserved.
//

#import "ApiManager.h"

//NETWORKING
NSURLSession *session;
NSURLSessionDataTask *dataTask;

#warning NEEDS FIXING
@implementation ApiManager {}

/**
 *  This is where all the Networking happens.
 *
 *  @param session NSURLSession: mySessionWithPassword:
 *  @param req     NSMutableURLRequest: myRequestWithURL:
 *  @param handler Function: Callback
 */
- (void)dataTaskFromSession:(NSURLSession *)session andRequest:(NSMutableURLRequest *)req withCallBack:(void(^)(NSError *err, NSMutableArray *response))handler{
    
    _completionHandler = [handler copy];
    
    dataTask = [session
                dataTaskWithRequest:req
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                    
                    if (!error && ((long)[httpResponse statusCode] == 200)) {
                        
                        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        
                        _completionHandler(false, json);
                        
                    } else {
                        _completionHandler(error, nil);
                    }
                    
                    return ;
                }];
    [dataTask resume];
}


/**
 *  Sets the NSURLSession that will be passed to dataTaskFromSession:andRequest:withCallBack:
 *
 *  @param pwd String: Password for the config node
 *
 *  @return NSURLSession Object
 */

- (NSURLSession *)mySessionWithPassword:(NSString *)pwd {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.HTTPAdditionalHeaders = @{@"AUTH": pwd};
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    return session;
}

-(NSURLSession *)mySession {
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    return session;
}

/**
 *  Sets NSMutableURLRequest that will be passed to dataTaskFromSession:andRequest:withCallBack:
 *
 *  @param url String: IP Address of Node-Red instance
 *
 *  @return NSMutableURLRequest Object
 */
- (NSMutableURLRequest *)myRequestWithURL:(NSString *)url {
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    return req;
}

/**
 *  Gets Data by setting Session with mySession and gets data with DataTaskFromSession:andRequest:withCallBack:
 *
 *  @param url String:
 *
 *  @return CallBack
 */
-(void)getDataWithURL:(NSString *)urlString uponCompletion:(void (^)(NSError *err, NSMutableArray *response))handler {
    _dataHandler = [handler copy];
    NSURLSession *sess = [self mySession];
    
    NSMutableURLRequest *req = [self myRequestWithURL:urlString];
    [self dataTaskFromSession:sess andRequest:req withCallBack:^(NSError *SessErr, NSMutableArray *SessRes) {
        
        _dataHandler(SessErr,SessRes);
    }];
}

@end
