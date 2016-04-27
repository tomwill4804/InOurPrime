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
-(NSArray*)primeFactors:(NSUInteger)value{
    
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
-(NSUInteger)largestCommonPrime:(NSUInteger)firstValue secondList:(NSUInteger)secondValue{
    
    NSArray* first = [self primeFactors:firstValue];
    NSArray* second = [self primeFactors:secondValue];
    
    NSUInteger max = 0;
    
    for (NSNumber* fv in first) {
        for (NSNumber* sv in second) {
            if ([fv integerValue] == [sv integerValue] && [fv integerValue] > max)
                max = [fv integerValue];
        }
    }
    
    return max;
    
}


@end
