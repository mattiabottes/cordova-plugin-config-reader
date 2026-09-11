#import <Cordova/CDVPlugin.h>

@interface ConfigReader : CDVPlugin

- (void)getPreference:(CDVInvokedUrlCommand*)command;

@end