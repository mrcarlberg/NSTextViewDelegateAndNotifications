//
//  AppDelegate.m
//  NSTextViewDelegateAndNotifications
//
//  Created by Martin Carlberg on 2017-12-21.
//  Copyright © 2017 Oops AB. All rights reserved.
//

#import "AppDelegate.h"
#import "NotificationStatistics.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.notificationStatistics = @[
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textView:willChangeSelectionFromCharacterRange:toCharacterRange:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textView:shouldChangeTextInRange:replacementString:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textView:doCommandBySelector:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textViewDidChangeSelection:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textView:shouldChangeTypingAttributes:toAttributes:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textViewDidChangeTypingAttributes:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textShouldBeginEditing:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textShouldEndEditing:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textDidBeginEditing:))],
                                    [NotificationStatistics notificationStatisticsWithName:NSStringFromSelector(@selector(textDidEndEditing:))],
                                    ];
}

- (IBAction)resetStatistics:(NSButton *)sender {
    self.globalOrder = 0;
    for (NotificationStatistics* ns in self.notificationStatistics) {
        ns.order = 0;
        ns.count = 0;
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NotificationStatistics * _Nullable)notificationStatisticsWithName:(NSString * _Nonnull )aName
{
    for (NotificationStatistics* ns in self.notificationStatistics) {
        if ([ns.name isEqualToString:aName]) {
            return ns;
        }
    }

    return nil;
}

- (void)registerNotificationWithSelector:(SEL _Nonnull)selector
{
    NotificationStatistics *ns = [self notificationStatisticsWithName:NSStringFromSelector(selector)];
    if (ns) {
        ns.count += 1;
        ns.order = self.globalOrder += 1;
    }
}

- (NSRange)textView:(NSTextView *)textView willChangeSelectionFromCharacterRange:(NSRange)oldSelectedCharRange toCharacterRange:(NSRange)newSelectedCharRange {
    [self registerNotificationWithSelector:_cmd];
    return newSelectedCharRange;
}

- (BOOL)textView:(NSTextView *)textView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(nullable NSString *)replacementString {
    [self registerNotificationWithSelector:_cmd];
    return YES;
}

- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    [self registerNotificationWithSelector:_cmd];
    return NO;
}

- (NSDictionary<NSAttributedStringKey, id> *)textView:(NSTextView *)textView shouldChangeTypingAttributes:(NSDictionary<NSString *,id> *)oldTypingAttributes toAttributes:(NSDictionary<NSAttributedStringKey, id> *)newTypingAttributes {
    [self registerNotificationWithSelector:_cmd];
    return newTypingAttributes;
}

- (void)textViewDidChangeSelection:(NSNotification *)notification {
    [self registerNotificationWithSelector:_cmd];
}

- (void)textViewDidChangeTypingAttributes:(NSNotification *)notification {
    [self registerNotificationWithSelector:_cmd];
}

- (BOOL)textShouldBeginEditing:(NSText *)textObject {
    [self registerNotificationWithSelector:_cmd];
    return YES;
}

- (BOOL)textShouldEndEditing:(NSText *)textObject {
    [self registerNotificationWithSelector:_cmd];
    return YES;
}

- (void)textDidBeginEditing:(NSNotification *)notification {
    [self registerNotificationWithSelector:_cmd];
}

- (void)textDidEndEditing:(NSNotification *)notification {
    [self registerNotificationWithSelector:_cmd];
}

@end
