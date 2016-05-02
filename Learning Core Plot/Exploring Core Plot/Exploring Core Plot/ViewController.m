//
//  ViewController.m
//  Exploring Core Plot
//
//  Created by Wes Van der Klomp on 5/2/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"
#import "CorePlot.h"

@interface ViewController ()

//@property CPTXYGraph *barChart;
@property (weak, nonatomic) IBOutlet CPTGraphHostingView *graphHostingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CPTXYGraph *newGraph = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
    
    [newGraph applyTheme:[CPTTheme themeNamed:kCPTPlainWhiteTheme]];
    
    // Plot space
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *) newGraph.defaultPlotSpace;
    plotSpace.yRange = [[CPTPlotRange alloc] initWithLocation:[NSNumber numberWithInt:0] length:[NSNumber numberWithInt:100]];
    plotSpace.xRange = [[CPTPlotRange alloc] initWithLocation:[NSNumber numberWithInt:0] length:[NSNumber numberWithInt:100]];
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) newGraph.axisSet;
    
    if (axisSet.xAxis != nil) {
        axisSet.xAxis.axisLineStyle = nil;
        axisSet.xAxis.minorTickLineStyle = nil;
        axisSet.xAxis.majorIntervalLength = [NSNumber numberWithInt:5];
    }
    
    if (axisSet.yAxis != nil) {
        axisSet.yAxis.axisLineStyle = nil;
        axisSet.yAxis.minorTickLineStyle = nil;
        axisSet.yAxis.majorIntervalLength = [NSNumber numberWithInt:5];
    }

    // Plots
    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor darkGrayColor] horizontalBars:YES];
    
    barPlot.dataSource = self;
    barPlot.identifier = @"Bar Plot 1";
    barPlot.barOffset = [NSNumber numberWithFloat:-0.5f];
    barPlot.baseValue = [NSNumber numberWithInt:0];
    
    [newGraph addPlot:barPlot toPlotSpace:plotSpace];
    
    _graphHostingView.hostedGraph = newGraph;
}

-(NSUInteger)numberOfRecordsForPlot:(nonnull CPTPlot *)plot {
    return 90;
}

- (id) numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx {
    CPTBarPlotField myField = (CPTBarPlotField)fieldEnum;
    
    switch (myField) {
        case CPTBarPlotFieldBarLocation:
            return [NSNumber numberWithUnsignedInteger:arc4random_uniform(74)];
            break;
        case CPTBarPlotFieldBarTip:
            return [NSNumber numberWithInt:(int)idx];
            break;
        default:
            return nil;
    }
}

@end
