//
//  ViewController.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import "ViewController.h"
#import "FYDecimalCalculator.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstTextfield;
@property (weak, nonatomic) IBOutlet UITextField *secondTextfield;
@property (weak, nonatomic) IBOutlet UILabel *labResult;

@property (nonatomic, weak) UIButton *selectedBtn;
@property (weak, nonatomic) IBOutlet UIButton *plusBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnSelected:self.plusBtn];
    
}

- (IBAction)btnSelected:(UIButton *)sender {
    if (self.selectedBtn != sender) {
        [self.selectedBtn setBackgroundColor:[UIColor clearColor]];
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
        [self.selectedBtn setBackgroundColor:[UIColor orangeColor]];
    }
}
 


- (IBAction)getResult:(UIButton *)sender {
    NSString *str  = nil;
    switch (self.selectedBtn.tag) {
        case 1: // 不保留小数点，四舍五入。
        {
            FYDecimalCalculator *calculator =  [FYDecimalCalculator  calculatorWithCalculationalType:FYDecimalCalculate_Adding];
            calculator.scale = 0;
            calculator.numberStyle =  NSNumberFormatterDecimalStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterDecimalStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterCurrencyStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterCurrencyStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterPercentStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterPercentStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterScientificStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterScientificStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterSpellOutStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterSpellOutStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterOrdinalStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterOrdinalStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterCurrencyISOCodeStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@" NSNumberFormatterCurrencyISOCodeStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterCurrencyPluralStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterCurrencyPluralStyle %@",str);
            
            calculator.numberStyle =  NSNumberFormatterCurrencyAccountingStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterCurrencyAccountingStyle %@",str);
            
            
            calculator.numberStyle =  NSNumberFormatterSpellOutStyle;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
            NSLog(@"NSNumberFormatterSpellOutStyle %@",str);
        } 
            break;
        case 2:
        {
            FYDecimalCalculator *calculator =  [FYDecimalCalculator  calculatorWithCalculationalType:FYDecimalCalculate_Subtracting];
            calculator.scale = 1;
            calculator.roundingMode = NSRoundDown;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
        }
            break;
        case 3: // 保留三位小数，向上取整
        {
            FYDecimalCalculator *calculator =  [FYDecimalCalculator  calculatorWithCalculationalType:FYDecimalCalculate_Multiplying];
            calculator.scale = 3;
            calculator.roundingMode = NSRoundUp;
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
        }
            break;
        case 4: // 保留两位小数，四舍五入
        {
            FYDecimalCalculator *calculator =  [FYDecimalCalculator  calculatorWithCalculationalType:FYDecimalCalculate_Dividing];
            str =  [calculator decimalString:self.firstTextfield.text calculateWithOtherDecimalString:self.secondTextfield.text];
        }
            break;
        default:
            break;
    }
    
    self.labResult.text = str;
}


@end
