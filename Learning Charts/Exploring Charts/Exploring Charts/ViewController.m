//
//  ViewController.m
//  Exploring Charts
//
//  Created by Wes Van der Klomp on 5/3/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BarChartView *barChartView;
@property NSArray *months;
@property NSArray *moneys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _months = [NSArray arrayWithObjects:
               @"Jan",
               @"Feb",
               @"Mar",
               @"Apr",
               @"May",
               @"Jun",
               @"Jul",
               @"Aug",
               @"Sep",
               @"Oct",
               @"Nov",
               @"Dec",
               nil];
    
    _moneys = [NSArray arrayWithObjects:
               [NSNumber numberWithInteger: 432],
               [NSNumber numberWithInteger: 314],
               [NSNumber numberWithInteger: 142],
               [NSNumber numberWithInteger: 532],
               [NSNumber numberWithInteger: 435],
               [NSNumber numberWithInteger: 342],
               [NSNumber numberWithInteger: 533],
               [NSNumber numberWithInteger: 532],
               [NSNumber numberWithInteger: 513],
               [NSNumber numberWithInteger: 975],
               [NSNumber numberWithInteger: 725],
               [NSNumber numberWithInteger: 918],
               nil];
    
    [self setChartDataPoints:_months values:_moneys];
}

- (void) setChartDataPoints:(NSArray *)points values:(NSArray *)values {
    _barChartView.noDataTextDescription = @"AHHAahAHahaHAH?!!?!!!";
    
    NSMutableArray *dataEntries;
    
    for (int i = 0; i < points.count; i++) {
        double val = [[points objectAtIndex:i] doubleValue];
        
        BarChartDataEntry *dataEntry = [[BarChartDataEntry alloc] initWithValue:val xIndex:i];
        
        [dataEntries addObject:dataEntry];
    }
    
    BarChartDataSet *chartDataSet = [[BarChartDataSet alloc] initWithYVals:dataEntries label:@"Money made"];
    
//    NSMutableArray *chartDataSets;
    
//    [chartDataSets addObject:chartDataSet];
    
    BarChartData *chartData = [[BarChartData alloc] initWithXVals:_months dataSet:chartDataSet];
    
    _barChartView.data = chartData;
}



@end
