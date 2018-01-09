//
//  NotificationStatistics.m
//  NSTextViewDelegateAndNotifications
//
//  Created by Martin Carlberg on 2017-12-21.
//  Copyright © 2017 Oops AB. All rights reserved.
//

#import "NotificationStatistics.h"

@implementation NotificationStatistics

+ (instancetype)notificationStatisticsWithName:(NSString*)aName
{
    return [[NotificationStatistics alloc] initWithName:aName];
}

- (instancetype)initWithName:(NSString*)aName
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.order = 0;
        self.count = 0;
    }
    return self;
}

@end
