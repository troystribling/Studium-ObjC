//
//  ProtocolExercises.m
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/15/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import "ProtocolExercises.h"

@implementation ProtocolExercises

- (void)doThing {
    NSLog(@"Doing Something");
}

@end

// Manager
@implementation Manager

- (void)manage {
    [self.delegate doThing];
}

- (void)fire {
    if ([self.delegate respondsToSelector:@selector(anotherThing)]) {
        [self.delegate anotherThing];
    } else {
        NSLog(@"another thing not implemented");
    }
}

@end

// Managed
@implementation Managed

- (id)init {
    self = [super init];
    if (self) {
        self.manager = [[Manager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void)doThing {
    NSLog(@"I am working");
}

@end


// Fired
@implementation Fired

- (id)init {
    self = [super init];
    if (self) {
        self.manager = [[Manager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

- (void)doThing {
    NSLog(@"I am a slacker");
}


- (void)anotherThing {
    NSLog(@"I was fired");
}

@end
