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

-(IBAction)doCalc:(id)sender{
    
    switch (calcType) {
        case calcCheck: {
            
            //
            //  build array for all numbers entered and check each one to
            //  see if it is a prime number
            //
            NSString* msg = @"Prime: ";
            NSArray* numbers = [self.firstList.text componentsSeparatedByString:@" "];
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
            NSArray* list = [brain primeFactos:[self.firstList.text integerValue]];
            
            NSString* msg = @"Prime:";
            
            for (NSNumber* num in list){
                NSString* strText = [NSString stringWithFormat:@" %@,", num];
                msg = [msg stringByAppendingString:strText];
            }
            self.functionAnswer.text = [msg substringToIndex:[msg length] - 1];
            break;
        }
            
        case calcLargest: {
            
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
    
    if (calcType != calcLargest)
        self.secondList.enabled = NO;
    else
        self.secondList.enabled = YES;
    
    self.calcButton.enabled = NO;
    if ( (self.firstList.text.length > 0) &&
        (self.secondList.text.length > 0 || !self.secondList.enabled) )
        self.calcButton.enabled = YES;

    
}


@end
