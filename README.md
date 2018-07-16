# Omlet Arcade ShareKit

Share from your app to [Omlet Arcade](https://arcade.omlet.me/) on iOS.

## Get Started
1. Drag the folder `OMLArcadeShareKit` into your project.
2. __(Important)__ In `Info.plist` of your project, add `omletarcade` in the array of key `LSApplicationQueriesSchemes` 
```
	<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>omletarcade</string>
	</array>
```
3. Share the URL to Omlet Arcade from your app
```
#import "OMLArcadeShareKit.h"

//...
NSURL *URLToShare = [NSURL URLWithString:@"http://google.com?q=123&a=345"];
NSURL *callback = [NSURL URLWithString:@"omletarcadedemo://"]; // optional
BOOL success = [OMLArcadeShareKit shareURL:URLToShare callbackURL:callback];
if (!success) {
    // Omlet arcade is not installed, open AppStore
    [OMLArcadeShareKit openArcadeInAppStore];
}
```
