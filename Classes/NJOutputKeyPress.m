//
#import <CoreGraphics/CoreGraphics.h>
//
//  NJOutputKeyPress.m
//  Enjoy
//
//  Created by Sam McCall on 5/05/09.
//

#import "NJOutputKeyPress.h"

#import "NJKeyInputField.h"

@implementation NJOutputKeyPress

+ (NSString *)serializationCode {
    return @"key press";
}

- (NSDictionary *)serialize {
    return _keyCode != NJKeyInputFieldEmpty
        ? @{ @"type": self.class.serializationCode, @"key": @(_keyCode) }
        : nil;
}

+ (NJOutput *)outputWithSerialization:(NSDictionary *)serialization {
	NSLog(@"keypress outputw");
    NJOutputKeyPress *output = [[NJOutputKeyPress alloc] init];
    output.keyCode = [serialization[@"key"] unsignedShortValue];
    return output;
}

- (void)trigger {
	NSLog(@"trig");
    if (_keyCode != NJKeyInputFieldEmpty) {
		NSLog(@"not empty");
        CGEventRef keyDown = CGEventCreateKeyboardEvent(NULL, _keyCode, YES);
        CGEventPost(kCGHIDEventTap, keyDown);
		NSLog(@"event keydown sent");
        CFRelease(keyDown);
    }
}

- (void)untrigger {
	NSLog(@"untrig");
    if (_keyCode != NJKeyInputFieldEmpty) {
        CGEventRef keyUp = CGEventCreateKeyboardEvent(NULL, _keyCode, NO);
        CGEventPost(kCGHIDEventTap, keyUp);
        CFRelease(keyUp);
    }
}

@end
