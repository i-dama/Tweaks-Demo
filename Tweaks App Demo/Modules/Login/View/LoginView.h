//
//  LoginView.h
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginView <NSObject>

- (void)showLoading;
- (void)showSuccess;
- (void)showErrorWithMessage:(NSString *)message;

- (void)setLoginEnabled:(BOOL)enabled;

@end

@protocol LoginViewDelegate <NSObject>

- (void)usernameDidChange:(NSString *)username;
- (void)passwordDidChange:(NSString *)password;
- (void)login;

@end
