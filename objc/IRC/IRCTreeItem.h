// Created by Satoshi Nakagawa.
// You can redistribute it and/or modify it under the Ruby's license or the GPL2.

#import <Cocoa/Cocoa.h>
#import "LogController.h"


@protocol IRCTreeItem

- (BOOL)isClient;

- (LogController*)log;

- (void)resetState;
- (void)setUnreadState;
- (void)setKeywordState;
- (void)setNewTalkState;

- (int)numberOfChildren;
- (id)childAtIndex:(int)index;
- (NSString*)label;

@end