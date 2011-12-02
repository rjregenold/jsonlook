//
//  LEOPrettyPrinter.m
//  jsonlook
//
//  Created by RJ Regenold on 12/2/11.
//  Copyright (c) 2011 Binary Lion Studios, LLC. All rights reserved.
//

#import "SBJson.h"

#import "LEOPrettyPrinter.h"

@implementation LEOPrettyPrinter

+ (NSData *)prettyJSONDataWithURL:(NSURL *)url {
  NSStringEncoding encoding;
  NSString *fileContents = [NSString stringWithContentsOfURL:url usedEncoding:&encoding error:nil];
  SBJsonParser *parser = [[SBJsonParser alloc] init];
  SBJsonWriter *writer = [[SBJsonWriter alloc] init];
  [writer setHumanReadable:YES];
  [writer setSortKeys:YES];
  NSData *prettyJsonData = [[writer stringWithObject:[parser objectWithString:fileContents]] dataUsingEncoding:encoding];
  [parser release];
  [writer release];  
  return prettyJsonData;
}

@end
