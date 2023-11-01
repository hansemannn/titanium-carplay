/**
 * Axway Titanium
 * Copyright (c) 2018-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

import TitaniumKit
import CarPlay

@objc(TiCarplayListTemplateProxy)
public class TiCarplayListTemplateProxy : TiCarplayTemplateProxy {

  public override func _init(withProperties properties: [AnyHashable : Any]!) {
    super._init(withProperties: properties)
        
    let title = TiUtils.stringValue("title", properties: properties)
    let sections = properties["sections"] as? [[String: Any]]

    template = CPListTemplate(title: title, sections: mapped(sections: sections))
  }
  
  private func mapped(sections: [[String: Any]]?) -> [CPListSection] {
    guard let sections else {
      return []
    }
    
    return sections.map { section in
      if let items = section["items"] as? [[String: Any]] {
        return CPListSection(items: items.map({ item in
          let text = item["text"] as? String
          let detailText = item["detailText"] as? String
          let handler = item["handler"] as? KrollCallback

          let listItem = CPListItem(text: text, detailText: detailText)
          listItem.handler = { [weak self] (item, completion) in
            handler?.callAsync([], thisObject: self)
            completion()
          }
          
          return listItem
        }))
      }
      
      return CPListSection(items: [])
    }
  }
}
