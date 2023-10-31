//
//  TiCarplayModule.swift
//  titanium-carplay
//
//  Created by Your Name
//  Copyright (c) 2023 Your Company. All rights reserved.
//

import UIKit
import TitaniumKit

/**
 
 Titanium Swift Module Requirements
 ---
 
 1. Use the @objc annotation to expose your class to Objective-C (used by the Titanium core)
 2. Use the @objc annotation to expose your method to Objective-C as well.
 3. Method arguments always have the "[Any]" type, specifying a various number of arguments.
 Unwrap them like you would do in Swift, e.g. "guard let arguments = arguments, let message = arguments.first"
 4. You can use any public Titanium API like before, e.g. TiUtils. Remember the type safety of Swift, like Int vs Int32
 and NSString vs. String.
 
 */

@objc(TiCarplayModule)
class TiCarplayModule: TiModule {

  public let testProperty: String = "Hello World"
  
  func moduleGUID() -> String {
    return "155b792e-29af-44b3-8b08-66cf0598ab47"
  }
  
  override func moduleId() -> String! {
    return "ti.carplay"
  }

  override func startup() {
    super.startup()
    debugPrint("[DEBUG] \(self) loaded")
  }

  @objc(example:)
  func example(arguments: Array<Any>?) -> String? {
    guard let arguments = arguments, let params = arguments[0] as? [String: Any] else { return nil }

    // Example method. 
    // Call with "MyModule.example({ hello: 'world' })"

    return params["hello"] as? String
  }
  
  @objc public var exampleProp: String {
     get { 
        // Example property getter
        return "Titanium rocks!"
     }
     set {
        // Example property setter
        // Call with "MyModule.exampleProp = 'newValue'"
        self.replaceValue(newValue, forKey: "exampleProp", notification: false)
     }
   }
}
