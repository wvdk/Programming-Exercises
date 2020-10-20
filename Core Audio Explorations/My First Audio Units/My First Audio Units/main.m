//
//  main.m
//  My First Audio Units
//
//  Created by Wesley Van der Klomp on 10/9/20.
//

#define kInputFileLocation CFSTR("/Users/wes/Developer/Programming-Exercises/Core Audio Explorations/Piano 1.m4a")

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

static void CheckError(OSStatus error, const char *operation)
{
    if (error == noErr) return;
    
    char errorString[20];
    // See if it appears to be a 4-char-code
    *(UInt32 *)(errorString + 1) = CFSwapInt32HostToBig(error);
    if (isprint(errorString[1]) && isprint(errorString[2]) &&
        isprint(errorString[3]) && isprint(errorString[4])) {
        
        errorString[0] = errorString[5] = '\'';
        errorString[6] = '\0';
    } else {
        // No, format it as an integer
        sprintf(errorString, "%d", (int)error);
    }
    
    fprintf(stderr, "Error: %s (%s)\n", operation, errorString);
    
    exit(1);
}

// Insert Listing 7.7 - 7.13 here
// Insert Listing 7.14 -7.17 here

#pragma mark main function
int    main(int argc, const char *argv[])
{
    // Open the input audio file
    // Get the audio data format from the file
    CFURLRef inputFileURL = CFURLCreateWithFileSystemPath(
                                  kCFAllocatorDefault,
                                  kInputFileLocation,
                                  kCFURLPOSIXPathStyle,
                                  false);
    
    MyAUGraphPlayer player = {0};
    
    // Open the input audio file
    CheckError(AudioFileOpenURL(inputFileURL, kAudioFileReadPermission, 0, &player.inputFile), "AUdioFileOpenURL failed");
    CFRelease(inputFileURL);
    
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
