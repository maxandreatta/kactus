//
//  NSString+LeftPadding.h
//  Kactus-Framework
//
//  Created by Andreatta Massimiliano on 11/09/14.
//  Copyright (c) 2014 Metide Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LeftPadding)

/**
 *  Metodo che permette di mettere del PADDING a sinistra di una stringa
 *
 *  @param newLength Nuova lunghezza della stringa
 *  @param padString <#padString description#>
 *  @param padIndex  <#padIndex description#>
 *
 *  @return Ritorna una NSString
 */
- (NSString *) stringByPaddingTheLeftToLength:(NSUInteger) newLength withString:(NSString *) padString startingAtIndex:(NSUInteger) padIndex;

@end
