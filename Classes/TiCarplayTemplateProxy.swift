/**
 * Axway Titanium
 * Copyright (c) 2018-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

import TitaniumKit
import CarPlay

@objc(TiCarplayTemplateProxy)
public class TiCarplayTemplateProxy : TiProxy {
  var template: CPTemplate! // to be overridden by the proxy subclasses
}
