//
//  Track.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "Track.h"

@implementation Track
//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.trackId forKey:@"trackId"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.playUrl64 forKey:@"playUrl64"];
    [aCoder encodeObject:self.playUrl32 forKey:@"playUrl32"];
    [aCoder encodeObject:self.playPathHq forKey:@"playPathHq"];
    [aCoder encodeObject:self.playPathAacv164 forKey:@"playPathAacv164"];
    [aCoder encodeObject:self.playPathAacv224 forKey:@"playPathAacv224"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.duration forKey:@"duration"];
    [aCoder encodeObject:self.albumId forKey:@"albumId"];
    [aCoder encodeObject:self.isPaid forKey:@"isPaid"];
    [aCoder encodeObject:self.isVideo forKey:@"isVideo"];
    [aCoder encodeObject:self.isDraft forKey:@"isDraft"];
    [aCoder encodeObject:self.isRichAudio forKey:@"isRichAudio"];
    [aCoder encodeObject:self.type forKey:@"type"];
    [aCoder encodeObject:self.relatedId forKey:@"relatedId"];
    [aCoder encodeObject:self.isHoldCopyright forKey:@"isHoldCopyright"];
    [aCoder encodeObject:self.processState forKey:@"processState"];
    [aCoder encodeObject:self.createdAt forKey:@"createdAt"];
    [aCoder encodeObject:self.coverSmall forKey:@"coverSmall"];
    [aCoder encodeObject:self.coverMiddle forKey:@"coverMiddle"];
    [aCoder encodeObject:self.coverLarge forKey:@"coverLarge"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.smallLogo forKey:@"smallLogo"];
    [aCoder encodeObject:self.userSource forKey:@"userSource"];
    [aCoder encodeObject:self.opType forKey:@"opType"];
    [aCoder encodeObject:self.isPublic forKey:@"isPublic"];
    [aCoder encodeObject:self.likes forKey:@"likes"];
    [aCoder encodeObject:self.playtimes forKey:@"playtimes"];
    [aCoder encodeObject:self.comments forKey:@"comments"];
    [aCoder encodeObject:self.shares forKey:@"shares"];
    [aCoder encodeObject:self.status forKey:@"status"];
}

//解归档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
     
        self.trackId = [aDecoder decodeObjectForKey:@"trackId"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.playUrl64 = [aDecoder decodeObjectForKey:@"playUrl64"];
        self.playUrl32 = [aDecoder decodeObjectForKey:@"playUrl32"];
        self.playPathHq = [aDecoder decodeObjectForKey:@"playPathHq"];
        self.playPathAacv164 = [aDecoder decodeObjectForKey:@"playPathAacv164"];
        self.playPathAacv224 = [aDecoder decodeObjectForKey:@"playPathAacv224"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.duration = [aDecoder decodeObjectForKey:@"duration"];
        self.albumId = [aDecoder decodeObjectForKey:@"albumId"];
        self.isPaid = [aDecoder decodeObjectForKey:@"isPaid"];
        self.isVideo = [aDecoder decodeObjectForKey:@"isVideo"];
        self.isDraft = [aDecoder decodeObjectForKey:@"isDraft"];
        self.isRichAudio = [aDecoder decodeObjectForKey:@"isRichAudio"];
        self.type = [aDecoder decodeObjectForKey:@"type"];
        self.relatedId = [aDecoder decodeObjectForKey:@"relatedId"];
        self.isHoldCopyright = [aDecoder decodeObjectForKey:@"isHoldCopyright"];
        self.processState = [aDecoder decodeObjectForKey:@"processState"];
        self.createdAt = [aDecoder decodeObjectForKey:@"createdAt"];
        self.coverSmall = [aDecoder decodeObjectForKey:@"coverSmall"];
        self.coverMiddle = [aDecoder decodeObjectForKey:@"coverMiddle"];
        self.coverLarge = [aDecoder decodeObjectForKey:@"coverLarge"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.smallLogo = [aDecoder decodeObjectForKey:@"smallLogo"];
        self.userSource = [aDecoder decodeObjectForKey:@"userSource"];
        self.opType = [aDecoder decodeObjectForKey:@"opType"];
        self.isPublic = [aDecoder decodeObjectForKey:@"isPublic"];
        self.likes = [aDecoder decodeObjectForKey:@"likes"];
        self.playtimes = [aDecoder decodeObjectForKey:@"playtimes"];
        self.comments = [aDecoder decodeObjectForKey:@"comments"];
        self.shares = [aDecoder decodeObjectForKey:@"shares"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
    }
    return self;
}
@end
