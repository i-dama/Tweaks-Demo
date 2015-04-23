//
//  LoginPresenter.m
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import "LoginPresenter.h"
#import "LoginInteractor.h"
#import "TweakableLoginInteractor.h"

@interface LoginPresenter ()
@property (weak, nonatomic) id<LoginView> view;
@property (strong, nonatomic) id<LoginInteractor> interactor;

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@end

@implementation LoginPresenter

+ (instancetype)newWithView:(id<LoginView>)view
{
    return [[LoginPresenter alloc] initWithView:view];
}

- (instancetype)initWithView:(id<LoginView>)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.interactor = [TweakableLoginInteractor new];
        [self updateLoginState];
    }
    return self;
}

#pragma mark - View delegate

- (void)usernameDidChange:(NSString *)username
{
    self.username = username;
    [self updateLoginState];
}

- (void)passwordDidChange:(NSString *)password
{
    self.password = password;
    [self updateLoginState];
}

- (void)login
{
    [self.view showLoading];
    __typeof__(self) __weak weakSelf = self;
    [self.interactor loginWithUsername:self.username password:self.password success:^{
        if (weakSelf) {
            [weakSelf.view showSuccess];
            //Do something else
        }
    } failure:^(NSError *error) {
        if (weakSelf) {
            [weakSelf.view showErrorWithMessage:error.localizedDescription];
        }
    }];
}

#pragma mark - Utility

- (void)updateLoginState
{
    BOOL enabled = self.username.length > 0 && self.password.length > 0;
    [self.view setLoginEnabled:enabled];
}

@end
