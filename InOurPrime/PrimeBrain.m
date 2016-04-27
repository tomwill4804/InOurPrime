//
//  PrimeBrain.m
//  InOurPrime
//
//  Created by Tom Williamson on 4/27/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "PrimeBrain.h"

@implementation PrimeBrain

//
//  see if passed number is prime
//
-(BOOL) isPrime:(NSUInteger)value{
    
    BOOL prime = YES;
    
    for (int i = 2; i <= value - 1; i++) {
         if (value % i == 0) {
             prime = NO;
             break;
         }
    }


    return prime;
    
}

//
//  find all prime numbers for a range
//
-(NSArray*)primeFactos:(NSUInteger)value{
    
    NSMutableArray* list = [[NSMutableArray alloc] init];
    
    for (int i=2; i < value; i++) {
        if ([self isPrime:i])
            [list addObject:[NSNumber numberWithInteger:i]];
    }
    
    return list;
    
}


//
//  find largest number from passed array
//
-(NSUInteger)largestCommonPrime:(NSArray*)firstList secondList:(NSArray*)secondList{
    
    return 20;
    
}


@end
