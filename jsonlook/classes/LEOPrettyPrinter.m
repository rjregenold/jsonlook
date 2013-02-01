//
//  LEOPrettyPrinter.m
//  jsonlook
//
//  Created by RJ Regenold on 12/2/11.
//  Copyright (c) 2011 Binary Lion Studios, LLC. All rights reserved.
//

#import "LEOPrettyPrinter.h"

@implementation LEOPrettyPrinter

+ (NSData *)prettyJSONDataWithURL:(NSURL *)url {
  NSData *fileContents = [[NSString stringWithContentsOfURL:url usedEncoding:nil error:nil] dataUsingEncoding:NSUTF8StringEncoding];
  id data = [NSJSONSerialization JSONObjectWithData:fileContents options:NSJSONReadingAllowFragments error:nil];
  return [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
}

@end
