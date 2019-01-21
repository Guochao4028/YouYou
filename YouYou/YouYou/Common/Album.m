//
//  Album.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "Album.h"

@implementation Album
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.albumId forKey:@"albumId"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.intro forKey:@"intro"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.albumCoverUrl290 forKey:@"albumCoverUrl290"];
    [aCoder encodeObject:self.coverSmall forKey:@"coverSmall"];
    [aCoder encodeObject:self.coverMiddle forKey:@"coverMiddle"];
    [aCoder encodeObject:self.coverLarge forKey:@"coverLarge"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.tags forKey:@"tags"];
    [aCoder encodeObject:self.tracks forKey:@"tracks"];
    [aCoder encodeObject:self.playsCounts forKey:@"playsCounts"];
    [aCoder encodeObject:self.isFinished forKey:@"isFinished"];
    [aCoder encodeObject:self.serialState forKey:@"serialState"];
    [aCoder encodeObject:self.trackId forKey:@"trackId"];
    [aCoder encodeObject:self.trackTitle forKey:@"trackTitle"];
    [aCoder encodeObject:self.provider forKey:@"provider"];
    [aCoder encodeObject:self.isPaid forKey:@"isPaid"];
    [aCoder encodeObject:self.commentsCount forKey:@"commentsCount"];
    [aCoder encodeObject:self.priceTypeId forKey:@"priceTypeId"];
    [aCoder encodeObject:self.refundSupportType forKey:@"refundSupportType"];
    [aCoder encodeObject:self.isVipFree forKey:@"isVipFree"];
    [aCoder encodeObject:self.isDraft forKey:@"isDraft"];
    [aCoder encodeObject:self.customSubTitle forKey:@"customSubTitle"];
    
}

//解归档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.albumId = [aDecoder decodeObjectForKey:@"albumId"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.intro = [aDecoder decodeObjectForKey:@"intro"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.albumCoverUrl290 = [aDecoder decodeObjectForKey:@"albumCoverUrl290"];
        self.coverSmall = [aDecoder decodeObjectForKey:@"coverSmall"];
        self.coverMiddle = [aDecoder decodeObjectForKey:@"coverMiddle"];
        self.coverLarge = [aDecoder decodeObjectForKey:@"coverLarge"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.tags = [aDecoder decodeObjectForKey:@"tags"];
        self.tracks = [aDecoder decodeObjectForKey:@"tracks"];
        self.playsCounts = [aDecoder decodeObjectForKey:@"playsCounts"];
        self.isFinished = [aDecoder decodeObjectForKey:@"isFinished"];
        self.serialState = [aDecoder decodeObjectForKey:@"serialState"];
        self.trackId = [aDecoder decodeObjectForKey:@"trackId"];
        self.trackTitle = [aDecoder decodeObjectForKey:@"trackTitle"];
        self.provider = [aDecoder decodeObjectForKey:@"provider"];
        self.isPaid = [aDecoder decodeObjectForKey:@"isPaid"];
        self.commentsCount = [aDecoder decodeObjectForKey:@"commentsCount"];
        self.priceTypeId = [aDecoder decodeObjectForKey:@"priceTypeId"];
        self.refundSupportType = [aDecoder decodeObjectForKey:@"refundSupportType"];
        self.isVipFree = [aDecoder decodeObjectForKey:@"isVipFree"];
        self.isDraft = [aDecoder decodeObjectForKey:@"isDraft"];
        self.customSubTitle = [aDecoder decodeObjectForKey:@"customSubTitle"];
    }
    return self;
}
@end
