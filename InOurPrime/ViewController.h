//
//  ViewController.h
//  InOurPrime
//
//  Created by Tom Williamson on 4/27/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* firstList;
@property (weak, nonatomic) IBOutlet UITextField* secondList;
@property (weak, nonatomic) IBOutlet UILabel* functionLabel;
@property (weak, nonatomic) IBOutlet UILabel* functionAnswer;

@property (weak, nonatomic) IBOutlet UIButton* calcButton;

-(IBAction)doCalc:(id)sender;


@end

