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

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.moduleType forKey:@"moduleType"];
    [aCoder encodeObject:self.calcDimension forKey:@"calcDimension"];
    [aCoder encodeObject:self.tagName forKey:@"tagName"];
    [aCoder encodeObject:self.contentType forKey:@"contentType"];
    [aCoder encodeObject:self.keywordId forKey:@"keywordId"];
    [aCoder encodeObject:self.keywordName forKey:@"keywordName"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.hasMore forKey:@"hasMore"];
    [aCoder encodeObject:self.list forKey:@"list"];
}


//解归档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.moduleType = [aDecoder decodeObjectForKey:@"moduleType"];
        self.calcDimension = [aDecoder decodeObjectForKey:@"calcDimension"];
        self.tagName = [aDecoder decodeObjectForKey:@"tagName"];
        self.contentType = [aDecoder decodeObjectForKey:@"contentType"];
        self.keywordId = [aDecoder decodeObjectForKey:@"keywordId"];
        self.keywordName = [aDecoder decodeObjectForKey:@"keywordName"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.hasMore = [aDecoder decodeObjectForKey:@"hasMore"];
        self.list = [aDecoder decodeObjectForKey:@"list"];
    }
    return self;
}

@end
