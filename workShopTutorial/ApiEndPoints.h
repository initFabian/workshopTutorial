//
//  ApiEndPoints.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/29/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#ifndef ApiEndPoints_h
#define ApiEndPoints_h

#ifdef DEBUG //Developing

    #define API_ENDPOINT_HOST @"http://beta.json-generator.com"

#else //Production

    #define API_ENDPOINT_HOST @"http://beta.json-generator.com/production" //dummy url, doesnt work

#endif

// Feed routes
#define getFeed_URL    (API_ENDPOINT_HOST @"/api/json/get/4y6GQQCT")
#define postComment_URL    (API_URL @"/api/user/:uid/post/:pid/comment/") //dummy url, doesnt work


//User routes
#define getUserInfo_URL     (API_URL @"/api/user/:uid/info") //dummy url, doesnt work
#define deleteUser_URL     (API_URL @"/api/user/:uid/delete") //dummy url, doesnt work


#endif /* ApiEndPoints_h */
