//
//  HomeNetApi.h
//  NetworkTest
//
//  Created by Arthur on 2017/10/12.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_Request.h"

@interface HomeNetApi : WB_Request

-(id)initWithVid:(NSString *)vid;

@end
