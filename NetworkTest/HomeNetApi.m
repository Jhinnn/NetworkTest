//
//  HomeNetApi.m
//  NetworkTest
//
//  Created by Arthur on 2017/10/12.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "HomeNetApi.h"

@implementation HomeNetApi {
    NSString *_vid;
}

-(id)initWithVid:(NSString *)vid
{
    if (self = [super init])
    {
        _vid = vid;
    }
    
    return self;
}

- (NSString *)requestUrl {
    return @"Vegetable/info/";
}

- (id)requestArgument {
    return @{
             @"vid" : _vid
             };
}

@end
