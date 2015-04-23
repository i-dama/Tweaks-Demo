//
//  LoginInteractor.h
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginInteractor <NSObject>

- (void)loginWithUsername:(NSString *)username password:(NSString *)password success:(void (^)())success failure:(void (^)(NSError *error))failure;

@end
