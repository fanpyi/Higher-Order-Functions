//
//  NSArray+HigherOrderFunctions.m
//  Beequick
//
//  Created by fanpyi on 20/3/15.
//

#import "NSArray+HigherOrderFunctions.h"

@implementation NSArray (HigherOrderFunctions)

-(NSArray *)map:(id (^)(id))block{
    NSMutableArray *t = @[].mutableCopy;
    for (id obj in self) {
        id result = block(obj);
        if (result) {
            [t addObject:result];
        }
    }
    return t;
}
-(id)reduce:(id)initial combine:(ReduceBlock)combine{
    id accumulator = initial;
    for (id item in self) {
        accumulator = combine(accumulator, item);
    }
    return accumulator;
}
-(NSArray *)filter:(BOOL (^)(id))block{
    NSMutableArray *t = @[].mutableCopy;
    for (id obj in self) {
        if (block(obj)) {
            [t addObject:obj];
        }
    }
    return t;
}

-(BOOL)contains:(BOOL (^)(id))block{
    for (id obj in self) {
        if (block(obj)) {
            return YES;
        }
    }
    return NO;
}

@end


