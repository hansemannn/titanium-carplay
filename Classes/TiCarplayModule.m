/**
 * titanium-carplay
 *
 * Created by Hans Knöchel
 * Copyright (c) 2018 Hans Knöchel. All rights reserved.
 */

#import "TiCarplayModule.h"
#import "TiApp.h"
#import "TiBase.h"
#import "TiCarplayInterfaceControllerProxy.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiCarplayModule

#pragma mark Internal

- (id)moduleGUID
{
  return @"beedf6ef-688c-4b53-98c7-9dc852dbb959";
}

- (NSString *)moduleId
{
  return @"ti.carplay";
}

#pragma mark Lifecycle

- (void)startup
{
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

- (void)_configure
{
  [super _configure];
  [[TiApp app] registerApplicationDelegate:self];
}

#pragma Public APIs

- (void)application:(nonnull UIApplication *)applicationdidConnectCarInterfaceController:(nonnull CPInterfaceController *)interfaceController toWindow:(nonnull CPMapContentWindow *)window
{
  if ([self _hasListeners:@"didConnect"]) {
    [self fireEvent:@"didConnect"
         withObject:@{
           @"interfaceController" : [[TiCarplayInterfaceControllerProxy alloc] _initWithPageContext:self.pageContext andInterfaceController:interfaceController]
         }];
  }
}

- (void)application:(nonnull UIApplication *)application didDisconnectCarInterfaceController:(nonnull CPInterfaceController *)interfaceController fromWindow:(nonnull CPMapContentWindow *)window
{
  if ([self _hasListeners:@"didDisconnect"]) {
    [self fireEvent:@"didDisconnect"
         withObject:@{
           @"interfaceController" : [[TiCarplayInterfaceControllerProxy alloc] _initWithPageContext:self.pageContext andInterfaceController:interfaceController]
         }];
  }
}

- (void)application:(UIApplication *)application didSelectNavigationAlert:(CPNavigationAlert *)navigationAlert
{
  if ([self _hasListeners:@"didSelectNavigationAlert"]) {
    [self fireEvent:@"didSelectNavigationAlert"];
  }
}

- (void)application:(UIApplication *)application didSelectManeuver:(CPManeuver *)maneuver
{
  if ([self _hasListeners:@"didSelectManeuver"]) {
    [self fireEvent:@"didSelectManeuver" withObject:@{@"maneuver" : @{ @"userInfo" : NULL_IF_NIL(maneuver.userInfo) }}];
  }
}

@end
