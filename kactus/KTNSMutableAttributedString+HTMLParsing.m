//
//  NSMutableAttributedString+HTMLParsing.m
//  TVSCnew
//
//  Created by Federico Polesello on 04/03/15.
//  Copyright (c) 2015 Federico Polesello. All rights reserved.
//

#import "KTNSMutableAttributedString+HTMLParsing.h"

@implementation NSMutableAttributedString (HTMLParsing)

- (NSMutableAttributedString*)setDefaultFontsWithNormalFont:(UIFont*)normalDefaultFont andBoldFont:(UIFont*)boldDefaultFont {
    
    // Set default font
    NSRange range = (NSRange){0,[self length]};
    [self enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        UIFont* currentFont = value;
        UIFont *replacementFont = nil;
        
        if ([currentFont.fontName rangeOfString:@"bold" options:NSCaseInsensitiveSearch].location != NSNotFound) {
            replacementFont = boldDefaultFont;
        } else {
            replacementFont = normalDefaultFont;
        }
        
        [self addAttribute:NSFontAttributeName value:replacementFont range:range];
        
    }];
    
    return self;
    
}

- (NSMutableAttributedString*)setDefaulColor:(UIColor*)defaultColor {
    
    NSRange range = (NSRange){0,[self length]};
    // Set default textcolor
    [self enumerateAttribute:NSForegroundColorAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        
        UIColor *replacementColor = defaultColor;
        
        [self addAttribute:NSForegroundColorAttributeName value:replacementColor range:range];
        
    }];
    
    return self;
    
}

@end
