//
//  apiEndPoints.h
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/28/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#ifndef apiEndPoints_h
#define apiEndPoints_h

#ifdef DEBUG
    #define API_ENDPOINT_HOST @"http://beta.json-generator.com"
#else
    #define API_ENDPOINT_HOST @"http://beta.json-generator.com/production"
#endif

// Examples
#define getFeed_URL    (API_ENDPOINT_HOST @"/api/json/get/4y6GQQCT")
//#define getMostPopular_URL     (API_URL @"/api/most_popular")


#endif /* apiEndPoints_h */
