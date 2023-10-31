/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiCarplayInterfaceControllerProxy.h"
#import "TiCarplayMapTemplateProxy.h"

@implementation TiCarplayInterfaceControllerProxy

#pragma mark Proxy Internal

- (id)_initWithPageContext:(id<TiEvaluator>)context andInterfaceController:(CPInterfaceController *)interfaceController
{
  if (self = [super _initWithPageContext:context]) {
    _interfaceController = interfaceController;
    _interfaceController.delegate = self;
  }

  return self;
}

#pragma mark Module Internal

- (CPInterfaceController *)interfaceController
{
  return _interfaceController;
}

#pragma mark Public APIs

- (void)setRootTemplate:(TiCarplayMapTemplateProxy *)rootTemplate
{
  [_interfaceController setRootTemplate:[(TiCarplayMapTemplateProxy *)rootTemplate mapTemplate] animated:YES];
}

#pragma mark CPInterfaceControllerDelegate

- (void)templateWillAppear:(CPTemplate *)aTemplate animated:(BOOL)animated
{
  if ([self _hasListeners:@"willAppear"]) {
    [self fireEvent:@"willAppear" withObject:@{@"animated" : @(animated)}];
  }
}

- (void)templateDidAppear:(CPTemplate *)aTemplate animated:(BOOL)animated
{
  if ([self _hasListeners:@"didAppear"]) {
    [self fireEvent:@"didAppear" withObject:@{@"animated" : @(animated)}];
  }
}

- (void)templateWillDisappear:(CPTemplate *)aTemplate animated:(BOOL)animated
{
  if ([self _hasListeners:@"willDisappear"]) {
    [self fireEvent:@"willDisappear" withObject:@{@"animated" : @(animated)}];
  }
}

- (void)templateDidDisappear:(CPTemplate *)aTemplate animated:(BOOL)animated
{
  if ([self _hasListeners:@"didDisappear"]) {
    [self fireEvent:@"didDisappear" withObject:@{@"animated" : @(animated)}];
  }
}

@end
