//
//  LoginPresenter.h
//  Tweaks App Demo
//
//  Created by Dama on 23/04/15.
//  Copyright (c) 2015 Infinum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginView.h"

@interface LoginPresenter : NSObject <LoginViewDelegate>

+ (instancetype)newWithView:(id<LoginView>)view;

@end
