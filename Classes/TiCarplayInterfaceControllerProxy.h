/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import <CarPlay/CarPlay.h>

@interface TiCarplayInterfaceControllerProxy : TiProxy <CPInterfaceControllerDelegate> {
  CPInterfaceController *_interfaceController;
}

@property (nonatomic, strong) CPInterfaceController *interfaceController;

- (id)_initWithPageContext:(id<TiEvaluator>)context andInterfaceController:(CPInterfaceController *)interfaceController;

@end
