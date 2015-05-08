//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by JIAN WANG on 5/8/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    
    NSMutableArray *inputArray = [[NSMutableArray alloc] initWithArray: [self componentsSeparatedByString:@" "]];
    
    NSCharacterSet *vowelCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"aieou"];
    
    for (int i = 0; i < inputArray.count; i++) {
        NSString *item = inputArray[i];
        item = [item lowercaseString];
        
        NSRange range = [item rangeOfCharacterFromSet:vowelCharacterSet];
        
        if (range.location == NSNotFound | range.location == 0) {
            // add ay to the end of the string
            item = [item stringByAppendingString:@"ay"];
        } else {
            NSUInteger firstVowelLocation = range.location;
            NSUInteger stringLength = item.length;
            NSRange firstPart = NSMakeRange(0, firstVowelLocation);
            NSRange secondPart = NSMakeRange(firstVowelLocation, stringLength - firstVowelLocation);
            NSString *firstString = [item substringWithRange:firstPart];
            NSString *secondString = [item substringWithRange:secondPart];
            item = [[secondString stringByAppendingString:firstString] stringByAppendingString:@"ay"];
        }
        inputArray[i] = [item capitalizedString];
    }
    
    return [inputArray componentsJoinedByString:@" "];
}

@end
