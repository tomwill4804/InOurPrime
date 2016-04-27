//
//  PrimeBrain.m
//  InOurPrime
//
//  Created by Tom Williamson on 4/27/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "PrimeBrain.h"

@implementation PrimeBrain


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


-(NSArray*)primeFactos:(NSUInteger)value{
    
    return @[@1, @2, @3];
    
}



-(NSUInteger)largestCommonPrime:(NSArray*)firstList secondList:(NSArray*)secondList{
    
    return 20;
    
}


@end
