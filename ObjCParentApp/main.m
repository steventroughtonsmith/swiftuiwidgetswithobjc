//
//  main.m
//  ObjCParentApp
//
//  Created by Steven Troughton-Smith on 02/10/2020.
//

#import <UIKit/UIKit.h>
#import "OCPAAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([OCPAAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
