//
//  ViewController.m
//  Exploring Charts
//
//  Created by Wes Van der Klomp on 5/3/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ChartViewDelegate>

@property (weak, nonatomic) IBOutlet BarChartView *barChartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Chart View Delegate Methods

- (void) chartValueSelected:(ChartViewBase *)chartView entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex highlight:(ChartHighlight *)highlight {
    NSLog(@"Value selected.");
}

@end
