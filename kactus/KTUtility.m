#import "KTUtility.h"

@implementation KTUtility

+ (BOOL)validateEmail:(NSString *)email {
    
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	BOOL isValid = [emailTest evaluateWithObject:email];
	return isValid;
    
}

+ (BOOL)validatePassword:(NSString *)password {
    // Tra 8 e 10 caratteri, almeno 1 maiuscola, almeno 1 minuscola e almeno un numero
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    if (!(password.length >7 && password.length < 11))
    {
        return false;
    }
    
    if ([password rangeOfCharacterFromSet:lowerCaseChars].location == NSNotFound || [password rangeOfCharacterFromSet:upperCaseChars].location == NSNotFound
        || [password rangeOfCharacterFromSet:numbers].location == NSNotFound) {
        return false;
    }
    else
        return true;
}

+ (NSString*)dictToJSONString:(NSDictionary*)dict {
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];

    if (!jsonData) {
        
        NSLog(@"JSON error: %@", error);
        return  nil;
        
    } else {
        
        NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
        // NSLog(@"JSON OUTPUT: %@",JSONString);
        return JSONString;
        
    }
    
}

+ (NSMutableDictionary*)JSONStringtoDictionary:(NSString*)jsonString {
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    if(jsonString.length != 0) {
        
        NSMutableDictionary *myDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        if(!myDictionary) {
            
            NSLog(@"%@",error);
            return  nil;
            
        } else {
            
            return myDictionary;
            
        }
        
    } else {
        
        NSLog(@"empty string");
        return  nil;
        
    }
    
}

+ (NSMutableArray*)JSONStringtoArray:(NSString*)jsonString {
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
    if(jsonString.length != 0) {
        
        NSMutableArray *arrayNewsByString = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];

        if(!arrayNewsByString) {
            
            NSLog(@"%@",error);
            return  nil;
            
        } else {
            
            return arrayNewsByString;
            
        }
        
    } else {
        
        NSLog(@"empty string");
        return  nil;
        
    }
    
}

+ (void)showActivityIndicatorToView:(UIView*)view withType:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:activityIndicatorViewStyle];
    
    activityView.center = view.center;
    
    CGRect viewFrame = view.frame;
    CGRect activityViewFrame = activityView.frame;
    activityViewFrame.origin.x = (viewFrame.size.width / 2) - (activityView.frame.size.width / 2);
    activityViewFrame.origin.y = (viewFrame.size.height / 2) - (activityView.frame.size.height / 2);
    activityView.frame = activityViewFrame;
    
    [activityView startAnimating];
    [view addSubview:activityView];
    
}

+ (void) hideActivityIndicator:(UIView*)view {
    
    UIView *activityView;
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];

    for (UIView *subview in subviewsEnum) {
        
		if ([subview isKindOfClass:[UIActivityIndicatorView class]]) {
            
			activityView = subview;
            break;
            
		}
        
	}

    if(activityView) {
        
        [activityView removeFromSuperview];
        activityView = nil;
        
    }
    
}

+ (void)showActivityIndicatorWithBackgroundViewToViewController:(UIViewController*)vc {
    
    UIView *viewParent = vc.view;
    
    UIView *viewBackgroundAlpha = [[UIView alloc] initWithFrame:viewParent.frame];
    viewBackgroundAlpha.backgroundColor = [UIColor blackColor];
    viewBackgroundAlpha.alpha = 0.3;
    viewBackgroundAlpha.tag = 200;
    
    UIView *viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 60)];
    viewContainer.backgroundColor = [UIColor colorWithHexString:@"f5f5f5" alpha:1.0f];
    viewContainer.layer.cornerRadius = 8;
    viewContainer.tag = 300;
    
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.center = viewContainer.center;
    
    CGRect viewFrame = vc.view.frame;
    CGRect viewContainerFrame = viewContainer.frame;
    viewContainerFrame.origin.x = (viewFrame.size.width / 2) - (viewContainerFrame.size.width / 2);
    viewContainerFrame.origin.y = (viewFrame.size.height / 2) - (viewContainerFrame.size.height / 2);
    viewContainer.frame = viewContainerFrame;
    
    [activityView startAnimating];
    
    [viewParent addSubview:viewBackgroundAlpha];
    
    [viewContainer addSubview:activityView];
    [viewParent addSubview:viewContainer];
    
}

+ (void)hideActivityIndicatorWithBackgroundViewFromController:(UIViewController*)vc {
    
    [[vc.view viewWithTag:200] removeFromSuperview];
    [[vc.view viewWithTag:300] removeFromSuperview];
    
}

+ (UIImageView*)showCustomIndicator:(UIView*)view {
    
    UIImageView* imageLoadingFrame = [[UIImageView alloc] initWithFrame:view.bounds];
    NSMutableArray* arrayTempImage = [NSMutableArray array];
    
    for (int iIndex = 0; iIndex < 8; iIndex++) {
    
        NSString *nameImage = [NSString stringWithFormat:@"%04i", iIndex];
        nameImage = [NSString stringWithFormat:@"loader_%@", nameImage];
        [arrayTempImage addObject:[UIImage imageNamed:nameImage]];
        
    }
    
    imageLoadingFrame.animationDuration = 1;
    imageLoadingFrame.contentMode = UIViewContentModeCenter;
    // imageLoadingFrame.backgroundColor = [UIColor colorWithHexString:@"FFFFFF" alpha:0.5];
    imageLoadingFrame.animationImages = [NSArray arrayWithArray:arrayTempImage];
    return imageLoadingFrame;
    
}

+ (NSString*)truncateString:(NSString *)stringToTruncate after:(int)maxRange {
    
    NSRange stringRange = {0, MIN([stringToTruncate length], maxRange)};
    stringRange = [stringToTruncate rangeOfComposedCharacterSequencesForRange:stringRange];
    NSString *shortString = [stringToTruncate substringWithRange:stringRange];
    
    if([stringToTruncate length] > maxRange)
        shortString = [NSString stringWithFormat:@"%@...", shortString];
    return shortString;
    
}

/**
 *  Inserisce una UIView con il gradiente e la ritorna per poterla salvare e manipolare successivamente
 *
 *  @param viewParent
 *  @param frameGradientView
 *  @param arrayColors
 *  @param arrayGradientLocation
 *
 *  @return ViewGradiente
 */
+ (UIView*)addGradientViewToBackView:(UIView*)viewParent withFrame:(CGRect)frameGradientView colors:(NSArray*)arrayColors andGradientLocation:(NSArray*)arrayGradientLocation {
    
    UIView *viewGradient = [[UIView alloc] initWithFrame:frameGradientView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.opacity = 1;
    gradient.frame = viewGradient.bounds;
    gradient.colors = arrayColors;
    gradient.locations = arrayGradientLocation;
    viewGradient.userInteractionEnabled = NO;
    [viewGradient.layer insertSublayer:gradient atIndex:0];

    [[viewParent superview] insertSubview:viewGradient belowSubview:viewParent];
    
    return viewGradient;
    
}

+ (id)checkInParsing:(id)value {
    
    if(value == [NSNull null]) {
        
        return value = nil;
        
    }
    
    return value;
    
}

@end
