#import "ConfigReader.h"

@implementation ConfigReader

- (void)getPreference:(CDVInvokedUrlCommand*)command
{
    NSString* key = [command.arguments objectAtIndex:0];
    // iOS forza le chiavi in lowercase in self.commandDelegate.settings
    NSString* lowercaseKey = [key lowercaseString];
    NSString* value = [self.commandDelegate.settings objectForKey:lowercaseKey];

    CDVPluginResult* pluginResult;
    if (value != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:value];
    } else {
        NSString* errorMsg = [NSString stringWithFormat:@"Preference '%@' non trovata in config.xml", key];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMsg];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end