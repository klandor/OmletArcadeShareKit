//
//  OMLArcadeShareKit.h
//
//  Created by Karl Diao on 2018/7/15.
//  Copyright © 2018年 Omlet Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMLArcadeShareKit : NSObject

+(BOOL)isInstalled;

+(void)openArcadeInAppStore;

+ (BOOL)shareURL:(NSURL *_Nonnull)url callbackURL:(NSURL *_Nullable)callbackURL;

+ (BOOL)startLiveWithJoinableURL:(NSURL *_Nullable)url;

@end
