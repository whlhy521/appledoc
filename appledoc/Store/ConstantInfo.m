//
//  ConstantInfo.m
//  appledoc
//
//  Created by Tomaž Kragelj on 4/23/12.
//  Copyright (c) 2012 Tomaz Kragelj. All rights reserved.
//

#import "Objects.h"
#import "StoreRegistrations.h"
#import "TypeInfo.h"
#import "DescriptorsInfo.h"
#import "ConstantInfo.h"

@implementation ConstantInfo

#pragma mark - Properties

- (TypeInfo *)constantTypes {
	if (_constantTypes) return _constantTypes;
	LogIntDebug(@"Initializing constant types due to first access...");
	_constantTypes = [[TypeInfo alloc] init];
	return _constantTypes;
}

- (DescriptorsInfo *)constantDescriptors {
	if (_constantDescriptors) return _constantDescriptors;
	LogIntDebug(@"Initializing constant descriptors due to first access...");
	_constantDescriptors = [[DescriptorsInfo alloc] init];
	return _constantDescriptors;
}

@end

#pragma mark - 

@implementation ConstantInfo (Registrations)

- (void)beginConstantTypes {
	LogStoVerbose(@"Starting constant types...");
	[self pushRegistrationObject:self.constantTypes];
}

- (void)beginConstantDescriptors {
	LogStoVerbose(@"Starting constant descriptors...");
	[self pushRegistrationObject:self.constantDescriptors];
}

- (void)appendConstantName:(NSString *)name {
	LogStoInfo(@"Assigning constant name %@...", name);
	self.constantName = name;
}

@end

#pragma mark - 

@implementation ConstantInfo (Logging)

- (NSString *)description {
	if (!_constantName) return @"constant";
	return [NSString stringWithFormat:@"constant %@", self.constantName];
}

- (NSString *)debugDescription {
	NSMutableString *result = [self descriptionStringWithComment];
	if (_constantTypes) [result appendFormat:@"%@ ", [self.constantTypes debugDescription]];
	if (_constantName) [result appendString:self.constantName];
	if (_constantDescriptors) [result appendFormat:@" %@", [self.constantDescriptors debugDescription]];
	[result appendString:@";"];
	return result;
}

@end
