//
//  NSString+SHA512.h
//  Kactus-Framework
//
//  Created by Andreatta Massimiliano on 03/01/14.
//
//

#import <Foundation/Foundation.h>

#include <CommonCrypto/CommonDigest.h>

@interface NSString (Utility)

/**
 *  Metodo per creare lo SHA512 di una stringa
 *
 *  @param source <#source description#>
 *
 *  @return Viene ritronata una stringa
 */
+ (NSString *) createSHA512:(NSString *)source;
- (NSString *) MD5;
- (NSString *) base64String;

@end
