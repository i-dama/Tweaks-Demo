//
//  LoginViewController.m
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import "LoginViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "LoginPresenter.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

//need a reference to the presenter so it doesn't get deallocated
@property (strong, nonatomic) id presenter;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.presenter = ({
        LoginPresenter *presenter = [LoginPresenter newWithView:self];
        self.delegate = presenter;
        presenter;
    });
    //setup text changed event
    [self.usernameTextField addTarget:self
                               action:@selector(usernameTextFieldValueChanged:)
                     forControlEvents:UIControlEventEditingChanged];
    [self.passwordTextField addTarget:self
                               action:@selector(passwordTextFieldValueChanged:)
                     forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Outlet actionsas

- (void)usernameTextFieldValueChanged:(UITextField *)sender
{
    [self.delegate usernameDidChange:sender.text];
}

- (void)passwordTextFieldValueChanged:(UITextField *)sender
{
    [self.delegate passwordDidChange:sender.text];
}

- (IBAction)loginButtonPressed:(id)sender
{
    [self.delegate login];
}

#pragma mark - UITExtField delegate



#pragma mark - View implementation

- (void)showLoading
{
    [SVProgressHUD show];
}

- (void)showSuccess
{
    [SVProgressHUD showSuccessWithStatus:nil];
}

- (void)showErrorWithMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

- (void)setLoginEnabled:(BOOL)enabled
{
    self.loginButton.enabled = enabled;
}

@end
