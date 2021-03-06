//
//  OMLArcadeShareKit.m
//
//  Created by Karl Diao on 2018/7/15.
//  Copyright © 2018年 Omlet Inc. All rights reserved.
//

#import "OMLArcadeShareKit.h"

#define ARCADE_URL_BASE @"omletarcade://"
#define ARCADE_SHARE_CONTENT_URL @"omletarcade://share/content?"
#define ARCADE_START_LIVE_URL @"omletarcade://startlive"

@implementation OMLArcadeShareKit

+(BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:ARCADE_URL_BASE]];
}

+ (void)openArcadeInAppStore {
    NSURL *appStoreURL = [NSURL URLWithString:@"http://onelink.to/vfwmwk"];
    [[UIApplication sharedApplication] openURL:appStoreURL];
}

+ (BOOL)shareURL:(NSURL *_Nonnull)url callbackURL:(NSURL *_Nullable)callbackURL {
    if (!url) {
        return NO;
    }

    NSString *URLStringEscaped = [OMLArcadeShareKit urlEscapedStringFromString:url.absoluteString];
    NSString *query = [@"url=" stringByAppendingString:URLStringEscaped];

    if (callbackURL) {
        NSString *callbackURLStringEscaped = [OMLArcadeShareKit urlEscapedStringFromString:callbackURL.absoluteString];
        query = [NSString stringWithFormat:@"%@&callback=%@", query, callbackURLStringEscaped];
    }
    
    NSString *finalURLString = [ARCADE_SHARE_CONTENT_URL stringByAppendingString:query];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];

    return [[UIApplication sharedApplication] openURL:finalURL];
}

+ (BOOL)startLiveWithJoinableURL:(NSURL *_Nullable)url {
    NSURL *startLiveURL = [NSURL URLWithString:ARCADE_START_LIVE_URL];
    if (url) {
        NSString *URLStringEscaped = [OMLArcadeShareKit urlEscapedStringFromString:url.absoluteString];
        NSString *query = [@"url=" stringByAppendingString:URLStringEscaped];
        __auto_type components = [NSURLComponents componentsWithURL:startLiveURL resolvingAgainstBaseURL:NO];
        components.query = query;
        startLiveURL = components.URL;
    }
    return [[UIApplication sharedApplication] openURL:startLiveURL];
}

+ (NSString *)urlEscapedStringFromString:(NSString *)string {
    NSMutableCharacterSet *URLQueryPartAllowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [URLQueryPartAllowedCharacterSet removeCharactersInString:@"&+=?"];

    return [string stringByAddingPercentEncodingWithAllowedCharacters:URLQueryPartAllowedCharacterSet];
}

@end
