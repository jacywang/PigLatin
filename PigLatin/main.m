//
//  main.m
//  PigLatin
//
//  Created by JIAN WANG on 5/8/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Input your words >");
        char str[1024];
        fgets(str, 1024, stdin);
        NSString *input = [[NSString alloc] initWithUTF8String: str];
        input = [input stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        input = [input stringByPigLatinization];
        NSLog(@"%@", input);
    }
    return 0;
}
