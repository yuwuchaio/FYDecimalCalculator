//
//  FYDecimalCalculator.h
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 2018/8/27.
//  Copyright © 2018年 codeFisher. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 typedef NS_ENUM(NSUInteger, NSRoundingMode) {
 NSRoundPlain,   // 四舍五入
 NSRoundDown,    // 向下取舍
 NSRoundUp,      // 向上入
 NSRoundBankers  // 同四舍五入。但是当需要进位的数字是5时根据前一位的奇偶性，奇数向上取值、偶数向下取值
 };
 Example:
 // value    1.2  1.21  1.25  1.35  1.27(原值)
 // Rounding policies:
 // Plain    1.2  1.2   1.3   1.4   1.3
 // Down     1.2  1.2   1.2   1.3   1.2
 // Up       1.2  1.3   1.3   1.4   1.3
 // Bankers  1.2  1.2   1.2   1.4   1.3
 */

/**
 
 typedef NS_ENUM(NSUInteger, NSNumberFormatterStyle) {
 NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,
 NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle,
 NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle,
 NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle,
 NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle,
 NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle,
 NSNumberFormatterOrdinalStyle  = kCFNumberFormatterOrdinalStyle, ios(9.0)
 NSNumberFormatterCurrencyISOCodeStyle = kCFNumberFormatterCurrencyISOCodeStyle, ios(9.0)
 NSNumberFormatterCurrencyPluralStyle  = kCFNumberFormatterCurrencyPluralStyle,ios(9.0)
 NSNumberFormatterCurrencyAccountingStyle = kCFNumberFormatterCurrencyAccountingStyle, ios(9.0)
 };
 
 Example
 ps:最终显示的值和.plist文件中的'Localization native development region'有关。
 original value:1234
                                en                    china
 NSNumberFormatterDecimalStyle: 1,234               1,234
 NSNumberFormatterCurrencyStyle: $1,234             ¥1,234
 NSNumberFormatterPercentStyle: 123,400%            123,400%
 NSNumberFormatterScientificStyle: 1E3                1E3
 NSNumberFormatterSpellOutStyle: one thousand two hundred thirty-four      一千二百三十四
 NSNumberFormatterOrdinalStyle :1,234th            第1,234
 NSNumberFormatterCurrencyISOCodeStyle: USD1,234    CNY1,234
 NSNumberFormatterCurrencyPluralStyle: 1,234.00 US dollars    1,234.00人民币
 NSNumberFormatterCurrencyAccountingStyle: $1,234        ¥1,234

 */

typedef NS_ENUM(NSUInteger, FYDecimalCalculateType){
    FYDecimalCalculate_Adding,
    FYDecimalCalculate_Subtracting,
    FYDecimalCalculate_Multiplying,
    FYDecimalCalculate_Dividing,
};

@interface FYDecimalCalculator : NSObject

/// 小数位数 deafult:2
@property (nonatomic, assign) short scale;
/// 进位模式 deafult:NSRoundPlain（四舍五入）
@property (nonatomic, assign) NSRoundingMode roundingMode;
// 结果显示的格式 deafult:NSNumberFormatterNoStyle（不做转换）
@property NSNumberFormatterStyle numberStyle;
/// 默认的Formatter
@property (nonatomic, readonly,strong) NSNumberFormatter *defualtNumberFormatter;
/// 自定义结果格式,(如果自定义了，则默认的格式化会失效)
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

// 初始化计算器
+ (instancetype)calculatorWithCalculationalType:(FYDecimalCalculateType)type;

- (NSString *)decimalString:(NSString *)decimalString calculateWithOtherDecimalString:(NSString *)otherString;
- (NSString *)decimalNumber:(NSNumber *)decimalNumber calculateWithOtherDecimalNumber:(NSNumber *)otherNumber;


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

#pragma mark - subClass
@interface FYAddingDecimalCalculator : FYDecimalCalculator
@end

@interface FYSubtractingDecimalCalculator : FYDecimalCalculator
@end

@interface FYMultiplyingDecimalCalculator : FYDecimalCalculator
@end

@interface FYDividingDecimalCalculator : FYDecimalCalculator
@end
