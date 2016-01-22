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
@property (strong, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (assign, nonatomic) CGFloat defaultTip;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.billAmountTextField resignFirstResponder];
    self.defaultTip = 0.15;

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Dismiss the keyboard whenever we touch outside the textfields by telling our textfields to give up first responder status
    [self.billAmountTextField resignFirstResponder];
}

- (IBAction)calculateTip:(UIButton *)sender {
    CGFloat num = [self.billAmountTextField.text integerValue];
    CGFloat tipPercent;

    if ([self.tipPercentageTextField.text isEqualToString:@""]) {
        tipPercent = 0.15;
    } else {
        tipPercent = [self.tipPercentageTextField.text integerValue] / 100.0;
    }
    
    CGFloat tipAmount = num * tipPercent;

    CGFloat roundedNum = ceilf(tipAmount * 100.0) / 100.0;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Tip Amount: %.2f", roundedNum];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
