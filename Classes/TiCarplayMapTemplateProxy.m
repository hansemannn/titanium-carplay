/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCarplayMapTemplateProxy.h"
#import "TiUtils.h"

@implementation TiCarplayMapTemplateProxy

#pragma mark Proxy Internal

- (id)_initWithPageContext:(id<TiEvaluator>)context andMapTemplate:(CPMapTemplate *)mapTemplate
{
  if (self = [super _initWithPageContext:context]) {
    _mapTemplate = mapTemplate;
  }

  return self;
}

#pragma mark Module Internal

- (CPMapTemplate *)mapTemplate
{
  return _mapTemplate;
}

- (void)startNavigationSession:(id)args
{
  ENSURE_SINGLE_ARG(args, NSDictionary);

  NSDictionary *proxyOrigin = [args objectForKey:@"origin"];
  NSDictionary *proxyDestination = [args objectForKey:@"destination"];
  NSArray<NSDictionary *> *proxyRouteChoices = [args objectForKey:@"routeChoices"];

  MKMapItem *origin = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:[self _coordinateFromDictionary:proxyOrigin]]];
  MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:[self _coordinateFromDictionary:proxyDestination]]];
  NSMutableArray<CPRouteChoice *> *routeChoices = [NSMutableArray arrayWithCapacity:proxyRouteChoices.count];

  for (NSDictionary *proxyRouteChoice in proxyRouteChoices) {
    NSArray<NSString *> *summaryVariants = proxyRouteChoice[@"summaryVariants"];
    NSArray<NSString *> *additionalInformationVariants = proxyRouteChoice[@"additionalInformationVariants"];
    NSArray<NSString *> *selectionSummaryVariants = proxyRouteChoice[@"selectionSummaryVariants"];

    CPRouteChoice *routeChoice = [[CPRouteChoice alloc] initWithSummaryVariants:summaryVariants
                                                  additionalInformationVariants:additionalInformationVariants
                                                       selectionSummaryVariants:selectionSummaryVariants];

    [routeChoices addObject:routeChoice];
  }

  CPTrip *trip = [[CPTrip alloc] initWithOrigin:origin
                                    destination:destination
                                   routeChoices:routeChoices];

  [_mapTemplate startNavigationSessionForTrip:trip];
}

#pragma mark Utilities

- (CLLocationCoordinate2D)_coordinateFromDictionary:(NSDictionary *)dictionary
{
  return CLLocationCoordinate2DMake([TiUtils doubleValue:dictionary[@"latitude"]], [TiUtils doubleValue:dictionary[@"longitude"]]);
}

@end
