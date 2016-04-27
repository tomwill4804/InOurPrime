//
//  PrimeBrain.h
//  InOurPrime
//
//  Created by Tom Williamson on 4/27/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrimeBrain : NSObject

-(BOOL) isPrime:(NSUInteger)value;
-(NSArray*)primeFactos:(NSUInteger)value;
-(NSUInteger)largestCommonPrime:(NSArray*)firstList secondList:(NSArray*)secondList;


@end
