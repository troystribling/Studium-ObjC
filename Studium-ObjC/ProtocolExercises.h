//
//  ProtocolExercises.h
//  Studium-ObjC
//
//  Created by Troy Stribling on 9/15/15.
//  Copyright © 2015 Troy Stribling. All rights reserved.
//

#import <Foundation/Foundation.h>

// protocol
@protocol TheProtocol <NSObject>

@required

- (void)doThing;

@optional

- (void)anotherThing;

@end

// procol implementaion
@interface ProtocolExercises : NSObject <TheProtocol>

@end


// manager
@interface Manager : NSObject

@property(nonatomic, weak) id<TheProtocol> delegate;

- (void)manage;

- (void)fire;

@end


// managed
@interface Managed : NSObject <TheProtocol>

@property(nonatomic, retain) Manager* manager;

@end


// fired
@interface Fired : NSObject <TheProtocol>

@property(nonatomic, retain) Manager* manager;

@end