//
//  ViewController.m
//  TipCalculator
//
//  Created by Graeme Harrison on 2016-01-22.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (strong, nonatomic) IBOutlet UILabel *tipAmountLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.billAmountTextField resignFirstResponder];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Dismiss the keyboard whenever we touch outside the textfields by telling our textfields to give up first responder status
    [self.billAmountTextField resignFirstResponder];
}

- (IBAction)calculateTip:(UIButton *)sender {
    CGFloat num = [self.billAmountTextField.text integerValue];
    CGFloat tip = num * 0.1500;
    CGFloat roundedNum = ceilf(tip * 100.0) / 100.0;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: %.2f", roundedNum];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
