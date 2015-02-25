//
//  UILabel(VAlign).m
//  Kactus-Framework
//
//  Created by Andreatta Massimiliano on 11/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

// UILabel(VAlign).m
#import "KTUILabel+VAlign.h"

@implementation UILabel (VAlign)

- (void) setVerticalAlignmentTop
{
    CGSize textSize = [self.text sizeWithFont:self.font
                            constrainedToSize:self.frame.size
                                lineBreakMode:self.lineBreakMode];
    
    CGRect textRect = CGRectMake(self.frame.origin.x,
                                 self.frame.origin.y,
                                 self.frame.size.width,
                                 textSize.height);
    [self setFrame:textRect];
    [self setNeedsDisplay];
}

@end