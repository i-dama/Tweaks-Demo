//
//  LoginViewController.h
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@interface LoginViewController : UIViewController <LoginView>
@property (weak, nonatomic) id<LoginViewDelegate> delegate;
@end
