//
//  main.m
//  My First Audio Units
//
//  Created by Wesley Van der Klomp on 10/9/20.
//

#define kInputFileLocation CFSTR("/Users/wes/Developer/Programming-Exercises/Core\ Audio\ Explorations/Piano\ 1.m4a")

#import <Foundation/Foundation.h>
#include <AudioToolbox/AudioToolbox.h>

#pragma mark user-data struct
typedef struct MyAUGraphPlayer
{
    AudioStreamBasicDescription inputFormat;
    AudioFileID                 inputFile;
    
    AUGraph graph;
    AudioUnit fileAU;
    
} MyAUGraphPlayer;

#pragma mark utility functions
// Insert Listing 4.2 here
// Insert Listing 7.7 - 7.13 here
// Insert Listing 7.14 -7.17 here

#pragma mark main function
int    main(int argc, const char *argv[])
{
    // Open the input audio file
    // Get the audio data format from the file
    // Insert Listing 7.3 here
    
    // Build a basic fileplayer->speakers graph
    // Configure the file player
    // Insert Listing 7.4 here
    
    // Start playing
    // Sleep until the file is finished
    // Insert Listing 7.5 here
    
    // Cleanup
    // Insert Listing 7.6 here
    
    return 0;
}
