#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import "LEOPrettyPrinter.h"

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize);
void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail);

OSStatus GenerateThumbnailForURL(void *thisInterface, QLThumbnailRequestRef thumbnail, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options, CGSize maxSize) {
  @autoreleasepool {
    NSDictionary *props = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"text/plain", kQLPreviewPropertyMIMETypeKey,
                           nil];
    QLThumbnailRequestSetThumbnailWithDataRepresentation(thumbnail, (CFDataRef)[LEOPrettyPrinter prettyJSONDataWithURL:(NSURL *)url], kUTTypeHTML, (CFDictionaryRef)props, NULL);
  }
  return noErr;
}

void CancelThumbnailGeneration(void *thisInterface, QLThumbnailRequestRef thumbnail) {
  // not supported
}
