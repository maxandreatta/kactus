//
//  NSMutableAttributedString+HTMLParsing.h
//  TVSCnew
//
//  Created by Federico Polesello on 04/03/15.
//  Copyright (c) 2015 Federico Polesello. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (HTMLParsing)

- (NSMutableAttributedString*)setDefaultFontsWithNormalFont:(UIFont*)normalFont andBoldFont:(UIFont*)boldFont;
- (NSMutableAttributedString*)setDefaulColor:(UIColor*)defaultColor;

@end
