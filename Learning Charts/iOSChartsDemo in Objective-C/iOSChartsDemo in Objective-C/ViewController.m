//
//  ViewController.m
//  iOSChartsDemo in Objective-C
//
//  Created by Wes Van der Klomp on 5/3/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"
@import Charts;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BarChartView *barChartView;
@property NSArray *months;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _months = [NSArray arrayWithObjects: @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec", nil];
    
    NSArray *unitsSold = [NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:20.0],
                          [NSNumber numberWithFloat:4.0],
                          [NSNumber numberWithFloat:6.0],
                          [NSNumber numberWithFloat:3.0],
                          [NSNumber numberWithFloat:12.0],
                          [NSNumber numberWithFloat:16.0],
                          [NSNumber numberWithFloat:4.0],
                          [NSNumber numberWithFloat:18.0],
                          [NSNumber numberWithFloat:2.0],
                          [NSNumber numberWithFloat:4.0],
                          [NSNumber numberWithFloat:5.0],
                          [NSNumber numberWithFloat:40.0],
                          nil];
    
    [self setChartWithDataPoints:_months andValues:unitsSold];
    
    _barChartView.noDataText = @"You need to provide data for the chart.";

}

- (void) setChartWithDataPoints:(NSArray *)dataPoints andValues:(NSArray *)values {
    
    // Create an array of DataEntry objects called dataEntries
    
    NSMutableArray<ChartDataEntry *> *dataEntries = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < dataPoints.count; i++) {
        NSNumber *n = [NSNumber numberWithInteger:i];
        NSNumber *value = [values objectAtIndex:n.unsignedIntegerValue];
        
        BarChartDataEntry *entry = [[BarChartDataEntry alloc] initWithValue:value.doubleValue xIndex:n.unsignedIntegerValue];
        
        [dataEntries addObject:entry];
        
        NSLog(@"%lu", dataEntries.count);
    }
    
    // Create DataSet and add dataEntries
    
    BarChartDataSet *dataSet = [[BarChartDataSet alloc] initWithYVals:dataEntries label:@"Units Sold"];
    
    // Create a ChartData object with dataSet and add to barChartView
    
    BarChartData *data = [[BarChartData alloc] initWithXVals:dataPoints dataSet:dataSet];
    
    _barChartView.data = data;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
