/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import <CarPlay/CarPlay.h>

@interface TiCarplayMapTemplateProxy : TiProxy {
  CPMapTemplate *_mapTemplate;
}

@property (nonatomic, strong) CPMapTemplate *mapTemplate;

- (id)_initWithPageContext:(id<TiEvaluator>)context andMapTemplate:(CPMapTemplate *)mapTemplate;

- (void)startNavigationSession:(id)args;

@end
