//
//  FYDecimalCalculator.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 2018/8/27.
//  Copyright © 2018年 codeFisher. All rights reserved.
//

#import "FYDecimalCalculator.h"
@interface FYDecimalCalculator ()

@property (nonatomic, readwrite, strong) NSNumberFormatter *defualtNumberFormatter;
@property (nonatomic, strong) NSDecimalNumberHandler *numberHandler;

@end

@implementation FYDecimalCalculator

+ (instancetype)calculatorWithCalculationalType:(FYDecimalCalculateType)type {
    FYDecimalCalculator *calculator;
    switch (type) {
        case FYDecimalCalculate_Adding:
            calculator = [[NSClassFromString(@"FYAddingDecimalCalculator") alloc] init];
            break;
        case FYDecimalCalculate_Subtracting:
            calculator = [[NSClassFromString(@"FYSubtractingDecimalCalculator") alloc] init];
            break;
        case FYDecimalCalculate_Multiplying:
            calculator = [[NSClassFromString(@"FYMultiplyingDecimalCalculator") alloc] init];
            break;
        case FYDecimalCalculate_Dividing:
            calculator = [[NSClassFromString(@"FYDividingDecimalCalculator") alloc] init];
            break;
    }
    return calculator;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scale = 2;
        self.roundingMode = NSRoundPlain;
        self.numberStyle = NSNumberFormatterNoStyle;
    }
    return self;
}

- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)other {
    return nil;
}

- (NSNumber *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber {
    return nil;
}

- (NSDecimalNumberHandler *)numberHandler {
    if (!_numberHandler) {
        _numberHandler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:self.roundingMode scale:self.scale raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    }
    return _numberHandler;
}

- (NSNumberFormatter *)defualtNumberFormatter {
    if (!_defualtNumberFormatter) {
        _defualtNumberFormatter = [[NSNumberFormatter alloc] init];
        _defualtNumberFormatter.minimumIntegerDigits = 1;
        _defualtNumberFormatter.alwaysShowsDecimalSeparator = !(self.scale == 0); // 如果小数保留0位不显示小数点'.'
        _defualtNumberFormatter.minimumFractionDigits = self.scale;
    }
    _defualtNumberFormatter.numberStyle = self.numberStyle;
    return _defualtNumberFormatter;
}
@end


@implementation FYAddingDecimalCalculator
- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)otherString {
    
    NSDecimalNumber *operand = [NSDecimalNumber decimalNumberWithString:decimalString];
    NSDecimalNumber *otherOperand = [NSDecimalNumber decimalNumberWithString:otherString];
    
    NSDecimalNumber *result = [operand decimalNumberByAdding:otherOperand withBehavior:self.numberHandler];
    return [self.numberFormatter?:self.defualtNumberFormatter stringFromNumber:result];
}

- (NSString *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber {
    return  [self decimalString:decimalNumber.stringValue calculateWithOtherDecimalString:otherNumber.stringValue];
}
@end

@implementation FYSubtractingDecimalCalculator
- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)otherString {
    NSDecimalNumber *operand = [NSDecimalNumber decimalNumberWithString:decimalString];
    NSDecimalNumber *otherOperand = [NSDecimalNumber decimalNumberWithString:otherString];
    
    NSDecimalNumber *result = [operand decimalNumberBySubtracting:otherOperand withBehavior:self.numberHandler];
    return [self.numberFormatter?:self.defualtNumberFormatter stringFromNumber:result];
}

- (NSString *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber {
    return  [self decimalString:decimalNumber.stringValue calculateWithOtherDecimalString:otherNumber.stringValue];
}
@end

@implementation FYMultiplyingDecimalCalculator
- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)otherString {
    NSDecimalNumber *operand = [NSDecimalNumber decimalNumberWithString:decimalString];
    NSDecimalNumber *otherOperand = [NSDecimalNumber decimalNumberWithString:otherString];
    
    NSDecimalNumber *result = [operand decimalNumberByMultiplyingBy:otherOperand withBehavior:self.numberHandler];
    return [self.numberFormatter?:self.defualtNumberFormatter stringFromNumber:result];
}

- (NSString *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber {
    return  [self decimalString:decimalNumber.stringValue calculateWithOtherDecimalString:otherNumber.stringValue];
}
@end

@implementation FYDividingDecimalCalculator
- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)otherString {
    NSDecimalNumber *operand = [NSDecimalNumber decimalNumberWithString:decimalString];
    NSDecimalNumber *otherOperand = [NSDecimalNumber decimalNumberWithString:otherString];
    
    NSDecimalNumber *result = [operand decimalNumberByDividingBy:otherOperand withBehavior:self.numberHandler];
    return [self.numberFormatter?:self.defualtNumberFormatter stringFromNumber:result];
}

- (NSString *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber {
    return  [self decimalString:decimalNumber.stringValue calculateWithOtherDecimalString:otherNumber.stringValue];
}
@end
