/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "ABI10_0_0RCTEventAnimationDriver.h"

@implementation ABI10_0_0RCTEventAnimationDriver
{
  NSArray<NSString *> *_eventPath;
}

- (instancetype)initWithEventPath:(NSArray<NSString *> *)eventPath
                        valueNode:(ABI10_0_0RCTValueAnimatedNode *)valueNode
{
  if ((self = [super init])) {
    _eventPath = eventPath;
    _valueNode = valueNode;
  }
  return self;
}

- (void) updateWithEvent:(id<ABI10_0_0RCTEvent>)event
{
  NSArray *args = [event arguments];
  // Supported events args are in the following order: viewTag, eventName, eventData.
  id curValue = args[2];
  for (NSString *key in _eventPath) {
    curValue = [curValue valueForKey:key];
  }

  _valueNode.value = ((NSNumber *)curValue).doubleValue;
  [_valueNode setNeedsUpdate];
}

@end
