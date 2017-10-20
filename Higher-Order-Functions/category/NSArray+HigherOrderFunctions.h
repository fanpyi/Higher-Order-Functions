//
//  NSArray+HigherOrderFunctions.h
//  Beequick
//
//  Created by fanpyi on 20/3/15.
//

#import <Foundation/Foundation.h>

@interface NSArray<T> (HigherOrderFunctions)

-(NSArray *)map:(id (^)(T obj))block;

-(id)reduce:(id)initial combine:(id (^)(id accumulator,T item))combine;

-(NSArray *)filter:(BOOL (^)(T obj))block;

-(BOOL)contains:(BOOL(^)(T obj))block;

@end
