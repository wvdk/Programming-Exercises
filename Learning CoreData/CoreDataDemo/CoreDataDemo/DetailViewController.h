//
//  DetailViewController.h
//  CoreDataDemo
//
//  Created by Wes Van der Klomp on 4/21/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

