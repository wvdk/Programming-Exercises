//
//  main.m
//  IfExample
//
//  Created by Wesley Van der Klomp on 4/3/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int stormCategory = 4;
        
//        if (stormCategory > 0) {
//            NSLog(@"Storm is coming!");
//        } else {
//            NSLog(@"Nothing");
//        }
//        
//        if (stormCategory == 4 || stormCategory == 5) {
//            NSLog(@"Big one!");
//        }
        
        switch (stormCategory) {
            case 1:
                NSLog(@"Small one");
                break;
            case 2:
                NSLog(@"Bigger");
                break;
            case 3:
                NSLog(@"It's a three!");
                break;
            case 4:
            case 5:
                NSLog(@"Super big one!");
                break;
            default:
                NSLog(@"I don't even...");
                break;
        }
        
    }
    return 0;
}
