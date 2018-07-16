//
//  OMLArcadeShareKit.m
//
//  Created by Karl Diao on 2018/7/15.
//  Copyright © 2018年 Omlet Inc. All rights reserved.
//

#import "OMLArcadeShareKit.h"

#define ARCADE_URL_BASE @"omletarcade://"
#define ARCADE_SHARE_CONTENT_URL @"omletarcade://share/content?"

@implementation OMLArcadeShareKit

+(BOOL)isInstalled {
    return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:ARCADE_URL_BASE]];
}


+ (BOOL)shareURL:(NSURL *_Nonnull)url callbackURL:(NSURL *_Nullable)callbackURL {
    if (!url) {
        return NO;
    }
    
    if (![self isInstalled]) {
        return NO;
    }

    NSMutableCharacterSet *URLQueryPartAllowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [URLQueryPartAllowedCharacterSet removeCharactersInString:@"&+=?"];
    
    NSString *URLStringEscaped = [url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:URLQueryPartAllowedCharacterSet];
    NSString *query = [@"url=" stringByAppendingString:URLStringEscaped];

    if (callbackURL) {
        NSString *callbackURLStringEscaped = [callbackURL.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:URLQueryPartAllowedCharacterSet];
        query = [NSString stringWithFormat:@"%@&callback=%@", query, callbackURLStringEscaped];
    }
    
    NSString *finalURLString = [ARCADE_SHARE_CONTENT_URL stringByAppendingString:query];
    NSURL *finalURL = [NSURL URLWithString:finalURLString];

    return [[UIApplication sharedApplication] openURL:finalURL];
}

@end
