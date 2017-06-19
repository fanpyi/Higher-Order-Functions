//
//  NSArray+Safe.h
//  Beequick
//
//  Created by fanpyi on 20/3/15.
//  Copyright (c) 2015 www.beequick.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef id (^ReduceBlock)(id accumulator,id item);
@interface NSArray (HigherOrderFunctions)

-(NSArray *)map:(id (^)(id obj))block;

-(id)reduce:(id)initial combine:(ReduceBlock)combine;

-(NSArray *)filter:(BOOL (^)(id obj))block;

-(BOOL)contains:(BOOL(^)(id obj))block;

@end
