//
//  TweakableLoginInteractor.m
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import "TweakableLoginInteractor.h"
#import <Tweaks/FBTweakInline.h>

@implementation TweakableLoginInteractor

- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
                  success:(void (^)())success
                  failure:(void (^)(NSError *))failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            BOOL requestSuccessful = FBTweakValue(@"Login", @"Login", @"Request Succesful", YES);
            if (requestSuccessful) {
                BOOL enteredDataValid = FBTweakValue(@"Login", @"Login", @"Username/Password correct", YES);
                if (enteredDataValid) {
                    if (success) {
                        success();
                    }
                } else {
                    if (failure) {
                        failure([NSError errorWithDomain:@"co.infinum.tweaks-demo"
                                                    code:1000
                                                userInfo:@{NSLocalizedDescriptionKey : @"Incorrect username/password combination"}]);
                    }
                }
            } else {
                if (failure) {
                    NSString *errorMessage = FBTweakValue(@"Login", @"Login", @"Error message", @"An error occured");
                    failure([NSError errorWithDomain:@"co.infinum.tweaks-demo"
                                                code:1000 userInfo:@{NSLocalizedDescriptionKey :
                                                                         errorMessage}]);
                }
            }
        });
    });

}

@end
