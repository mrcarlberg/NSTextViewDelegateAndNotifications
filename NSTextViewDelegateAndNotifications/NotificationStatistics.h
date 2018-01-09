//
//  NotificationStatistics.h
//  NSTextViewDelegateAndNotifications
//
//  Created by Martin Carlberg on 2017-12-21.
//  Copyright © 2017 Oops AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationStatistics : NSObject

@property NSString *name;
@property NSUInteger order;
@property NSUInteger count;

+ (instancetype)notificationStatisticsWithName:(NSString*)aName;
- (instancetype)initWithName:(NSString*)aName;

@end
