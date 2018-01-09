//
//  AppDelegate.h
//  NSTextViewDelegateAndNotifications
//
//  Created by Martin Carlberg on 2017-12-21.
//  Copyright © 2017 Oops AB. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTextViewDelegate>

@property NSArray *notificationStatistics;
@property NSUInteger globalOrder;

@property (weak) IBOutlet NSTextField *willChangeSelectionFromCharacterRangeOrder;
@property (weak) IBOutlet NSTextField *shouldChangeTextInRangeOrder;
@property (weak) IBOutlet NSTextField *doCommandBySelectorOrder;
@property (weak) IBOutlet NSTextField *textViewDidChangeSelectionOrder;
@property (weak) IBOutlet NSTextField *textViewDidChangeTypingAttributesOrder;

@property (weak) IBOutlet NSTextField *willChangeSelectionFromCharacterRangeCounter;
@property (weak) IBOutlet NSTextField *shouldChangeTextInRangeCounter;
@property (weak) IBOutlet NSTextField *doCommandBySelectorCounter;
@property (weak) IBOutlet NSTextField *textViewDidChangeSelectionCounter;
@property (weak) IBOutlet NSTextField *textViewDidChangeTypingAttributesCounter;

@end

