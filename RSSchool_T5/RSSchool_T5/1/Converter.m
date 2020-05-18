#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    // good luck
    NSMutableString *formattedNumber = [[NSMutableString alloc] init];

        NSMutableArray *internationalCode =
    [@[[@[@10, @"7", @"RU"] mutableCopy],[@[@10, @"7", @"KZ"] mutableCopy],
       [@[@8, @"373", @"MD"] mutableCopy],[@[@8, @"374", @"AM"] mutableCopy],
       [@[@9, @"375", @"BY"] mutableCopy],[@[@9, @"380", @"UA"] mutableCopy],
       [@[@9, @"992", @"TJ"] mutableCopy],[@[@8, @"993", @"TM"] mutableCopy],
       [@[@9, @"994", @"AZ"] mutableCopy],[@[@9, @"996", @"KG"] mutableCopy],
    [@[@9, @"998", @"UZ"] mutableCopy],
        ] mutableCopy];
        int checkCode = -1;
        for (int counterRow = 0; counterRow < 11; counterRow++) {
            int counterOfMatch = 0;
            for (int counterOfStringLenght = 0; counterOfStringLenght < [internationalCode[ counterRow][1] length]; counterOfStringLenght++) {
                if ([string length] >= [internationalCode[counterRow][1] length]) {
                    if ([string characterAtIndex:counterOfStringLenght] == [internationalCode[counterRow][1] characterAtIndex:counterOfStringLenght]) {
                        counterOfMatch++;
                    }
            }
        }
        if (counterOfMatch == [internationalCode[counterRow][1] length]) {
            checkCode = counterRow;
            if (counterOfMatch == 1 && [string length] >= 2) {
                if ([string characterAtIndex:1] == '7')
                    checkCode = 1;
            }
            break;
        }
    }

    if (checkCode != -1) {
        int lenghtOfPhoneNumber = (int)([string length] - [internationalCode[checkCode][1] length]);
        [formattedNumber appendFormat:@"+%@", internationalCode[checkCode][1]];
        
        if (lenghtOfPhoneNumber > 0)
            [formattedNumber appendString:@" ("];
        
        if ([internationalCode[checkCode][0] intValue] <= 9) {
            for (int counter = 2; counter > 0; counter--) {
                if (lenghtOfPhoneNumber > 0) {
                    [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                    lenghtOfPhoneNumber -= 1;
                    [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
                }
                else if (lenghtOfPhoneNumber == 0)
                    return @{KeyPhoneNumber: formattedNumber,
                             KeyCountry: internationalCode[checkCode][2]};
            }
            if (lenghtOfPhoneNumber > 0)
                [formattedNumber appendString:@") "];
        }
        if ([internationalCode[checkCode][0] intValue] >= 10) {
            for (int counter = 3; counter > 0; counter--) {
                if (lenghtOfPhoneNumber > 0) {
                    [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                    lenghtOfPhoneNumber -= 1;
                    [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
                }
                else if (lenghtOfPhoneNumber == 0)
                    return @{KeyPhoneNumber: formattedNumber,
                             KeyCountry: internationalCode[checkCode][2]};
            }
            if (lenghtOfPhoneNumber > 0)
                [formattedNumber appendString:@") "];
        }
        
        for (int counter = 3; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0) {
                [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: formattedNumber,
                         KeyCountry: internationalCode[checkCode][2]};
        }
        if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0)
            [formattedNumber appendString:@"-"];
        
        if ([internationalCode[checkCode][0] intValue] == 3) {
            for (int counter = 3; counter > 0; counter--) {
                if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0) {
                    [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                    lenghtOfPhoneNumber -= 1;
                    [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
                }
                else if (lenghtOfPhoneNumber == 0)
                    return @{KeyPhoneNumber: formattedNumber,
                             KeyCountry: internationalCode[checkCode][2]};
            }
        }
        
        for (int counter = 2; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0) {
                [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: formattedNumber,
                         KeyCountry: internationalCode[checkCode][2]};
        }
        if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0)
            [formattedNumber appendString:@"-"];
        
        for (int counter = 2; counter > 0; counter--) {
            if (lenghtOfPhoneNumber > 0 && [internationalCode[checkCode][0] intValue] > 0) {
                [formattedNumber appendString:[string substringWithRange:NSMakeRange([string length] - lenghtOfPhoneNumber, 1)]];
                lenghtOfPhoneNumber -= 1;
                [[internationalCode objectAtIndex:checkCode] setObject:[NSNumber numberWithInt:[[[internationalCode objectAtIndex:checkCode] objectAtIndex:0] intValue] - 1] atIndex:0];
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: formattedNumber,
                         KeyCountry: internationalCode[checkCode][2]};
        }
        return @{KeyPhoneNumber: formattedNumber,
                 KeyCountry: internationalCode[checkCode][2]};
    }
    else {
        [formattedNumber appendString:@"+"];
        int lenghtOfPhoneNumber = (int)[string length];
        for (int counter = 0; counter < 12; counter++) {
            if (lenghtOfPhoneNumber > 0) {
                [formattedNumber appendString:[string substringWithRange:NSMakeRange(counter, 1)]];
                lenghtOfPhoneNumber--;
            }
            else if (lenghtOfPhoneNumber == 0)
                return @{KeyPhoneNumber: formattedNumber,
                         KeyCountry: @""};
        }
        return @{KeyPhoneNumber: formattedNumber,
                 KeyCountry: @""};
    }
}
@end
