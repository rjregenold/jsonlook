#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import "LEOPrettyPrinter.h"

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options) {
  @autoreleasepool {
    NSDictionary *props = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"text/plain", kQLPreviewPropertyMIMETypeKey,
                           [NSNumber numberWithInt:700], kQLPreviewPropertyWidthKey,
                           [NSNumber numberWithInt:800], kQLPreviewPropertyHeightKey,
                           nil];
    QLPreviewRequestSetDataRepresentation(preview, (CFDataRef)[LEOPrettyPrinter prettyJSONDataWithURL:(NSURL *)url], kUTTypeHTML, (CFDictionaryRef)props);
  }
  return noErr;
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview) {
  // not supported
}
