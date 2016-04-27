//
//  ViewController.m
//  InOurPrime
//
//  Created by Tom Williamson on 4/27/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"
#import "PrimeBrain.h"

enum calcType {
    
    calcCheck = 0,
    calcFactor,
    calcLargest
    
};

@interface ViewController () {
    
    enum calcType calcType;
    
    PrimeBrain* brain;
    
}


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    brain = [[PrimeBrain alloc] init];
    
    calcType = calcCheck;
    
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection: 1] animated:NO
                          scrollPosition:UITableViewScrollPositionTop];
    
    [self.firstList addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.secondList addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
}

-(NSArray*)listFromString:(NSString*)string{
    
    NSArray *list = [self.firstList.text componentsSeparatedByString:@" "];
    NSMutableArray *flist = [[NSMutableArray alloc] init];
    
    for (NSString* s in list) {
        if (s.length > 0)
            [flist addObject:s];
    }
    return flist;
    
}


-(IBAction)doCalc:(id)sender{
    
    switch (calcType) {
        case calcCheck: {
            
            //
            //  build array for all numbers entered and check each one to
            //  see if it is a prime number
            //
            NSString* msg = @"Prime: ";
            NSArray* numbers = [self listFromString:self.firstList.text];
            for (NSString* num in numbers){
                
                BOOL isPrime = [brain isPrime:[num integerValue]];
                NSString* strText = [NSString stringWithFormat:@"%@:%@ ", num, isPrime ? @"Yes" : @"No"];
                
                msg = [msg stringByAppendingString:strText];
            }
            self.functionAnswer.text = msg;
            break;
            
        }
            
            
        case calcFactor: {
            
            //
            //  get a list of all prime factors for the entered value
            //
            NSUInteger value = [self.firstList.text integerValue];
            NSArray* list = [brain primeFactors:value];
            
            NSString* msg = [NSString stringWithFormat:@"Prime factors for %lu:", (unsigned long)value];
            
            for (NSNumber* num in list){
                NSString* strText = [NSString stringWithFormat:@" %@,", num];
                msg = [msg stringByAppendingString:strText];
            }
            self.functionAnswer.text = [msg substringToIndex:[msg length] - 1];
            break;
        }
            
            
        case calcLargest: {
            
            //
            //  find largest common prime number
            //
            
            NSArray* list = [self listFromString:self.firstList.text];
            
            NSUInteger val1 = [list[0] integerValue];
            NSUInteger val2 = [list[1] integerValue];
            NSUInteger max = [brain largestCommonPrime:val1 secondList:val2];
            
            NSString* strText = [NSString stringWithFormat:@"Largest common prime for %lu and %lu is %lu", val1, (unsigned long)val2, (unsigned long)max];
            
            self.functionAnswer.text = strText;
        
            break;
            
        }
            
        default:
            break;
    }
    
    
}


//
//  mark only one cell is second section and set the field attributes
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    if (indexPath.section == 1) {
        
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:indexPath];
        calcType = cell.tag;
        [self setFieldAttr];
        
    }
    
}

//
//  remove check on cell
//
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}


- (void)textFieldDidChange:(UITextField *)textField {
 
    [self setFieldAttr];
    
}


//
// enable fields based on data entered and function selected
//
-(void)setFieldAttr{
    
    self.calcButton.enabled = YES;
    
    if (self.firstList.text.length == 0)
        self.calcButton.enabled = NO;
    
    if (calcType == calcLargest) {
        NSArray *list = [self listFromString:self.firstList.text];
        if (list.count < 2)
            self.calcButton.enabled = NO;
    }
    
}



@end
