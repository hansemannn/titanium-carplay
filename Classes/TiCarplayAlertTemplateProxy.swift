/**
 * Axway Titanium
 * Copyright (c) 2018-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

import TitaniumKit
import CarPlay

@objc(TiCarplayAlertTemplateProxy)
public class TiCarplayAlertTemplateProxy : TiCarplayTemplateProxy {

  public override func _init(withProperties properties: [AnyHashable : Any]!) {
    super._init(withProperties: properties)
        
    let title = TiUtils.stringValue("title", properties: properties)
    let actions = properties["actions"] as? [[String: Any]]

    template = CPAlertTemplate(titleVariants: [title!], actions: mapped(actions: actions))
  }
  
  private func mapped(actions: [[String: Any]]?) -> [CPAlertAction] {
    guard let actions else {
      return []
    }
    
    return actions.map { action in
      guard let title = action["title"] as? String,
            let handler = action["handler"] as? KrollCallback else {
              fatalError("Missing action properties")
            }
            
      let destructive = action["destructive"] as? Bool ?? false

      return CPAlertAction(title: title, style: destructive ? .destructive : .default) { action in
        handler.callAsync([], thisObject: self)
      }
    }
  }
}
