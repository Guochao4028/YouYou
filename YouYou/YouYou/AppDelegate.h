//
//  AppDelegate.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/15.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

