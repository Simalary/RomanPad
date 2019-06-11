#include <math.h>

BOOL isScramblePassInstalled()
{
    return [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/ScramblePass.dylib"];
}

BOOL isDummyPassInstalled()
{
    return [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/DummyPass.dylib"];
}