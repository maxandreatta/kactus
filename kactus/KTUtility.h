#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KTUIColor+Utility.h"

@interface KTUtility : NSObject

// VALIDATOR
+ (BOOL)validateEmail:(NSString *)email;
+ (BOOL)validatePassword:(NSString *)password;

// ACTIVITY INDICATOR
+ (void)showActivityIndicatorToView:(UIView*)view withType:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle;
+ (void)hideActivityIndicator:(UIView*)view;
+ (UIImageView*)showCustomIndicator:(UIView*)view;
+ (void)showActivityIndicatorWithBackgroundViewToViewController:(UIViewController*)vc;
+ (void)hideActivityIndicatorWithBackgroundViewFromController:(UIViewController*)vc;

// PARSING
+ (NSString*)dictToJSONString:(NSDictionary*)dict;
+ (NSMutableDictionary*)JSONStringtoDictionary:(NSString*)jsonString;
+ (NSMutableArray*)JSONStringtoArray:(NSString*)jsonString;
+ (id)checkInParsing:(id)value;

+ (NSString*)truncateString:(NSString *)stringToTruncate after:(int)maxRange;

+ (UIView*)addGradientViewToBackView:(UIView*)viewParent withFrame:(CGRect)frameGradientView colors:(NSArray*)arrayColors andGradientLocation:(NSArray*)arrayGradientLocation;

@end
