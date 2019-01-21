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
    [aCoder encodeObject:self.album forKey:@"album"];
    [aCoder encodeObject:self.trackList forKey:@"trackList"];
    
}

//解归档
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.album = [aDecoder decodeObjectForKey:@"album"];
        self.trackList = [aDecoder decodeObjectForKey:@"trackList"];
    }
    return self;
}
@end
