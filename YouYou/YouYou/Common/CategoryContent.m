//
//  CategoryContent.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "CategoryContent.h"

@implementation CategoryContent


+(NSDictionary *)mj_objectClassInArray{

    return @{@"list":@"Album"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"list" : @"list"
            };
}


@end
