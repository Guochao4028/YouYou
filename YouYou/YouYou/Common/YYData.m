//
//  YYData.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "YYData.h"

@implementation YYData

+(YYData*) shareInstance{
    static YYData * manager;
    if (!manager) {
        manager = [[super allocWithZone:NULL] init];
    }
    return manager;
};


@end
