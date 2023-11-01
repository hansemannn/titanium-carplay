//
//  TiCarplayModule.swift
//  titanium-carplay
//
//  Created by Your Name
//  Copyright (c) 2023 Your Company. All rights reserved.
//

import UIKit
import TitaniumKit
import CarPlay

@objc(TiCarplayModule)
class TiCarplayModule: TiModule {

  private lazy var interfaceController: CPInterfaceController? = {
    guard let carPlayScene = UIApplication.shared.connectedScenes.first(where: { $0 is CPTemplateApplicationScene }) as? CPTemplateApplicationScene,
          let sceneDelegate = carPlayScene.delegate as? TiCarPlaySceneDelegate,
          let interfaceController = sceneDelegate.interfaceController else {
      return nil
    }
    
    return interfaceController
  }()
  
  func moduleGUID() -> String {
    return "155b792e-29af-44b3-8b08-66cf0598ab47"
  }
  
  override func moduleId() -> String! {
    return "ti.carplay"
  }
  
  @objc(setRootTemplate:)
  func setRootTemplate(template: TiCarplayTemplateProxy) {
    guard let interfaceController else {
      return
    }
    
    interfaceController.setRootTemplate(template.template, animated: true, completion: nil)
  }
  
  @objc(pushTemplate:)
  func pushTemplate(template: [TiCarplayTemplateProxy]) {
    guard let interfaceController, let template = template.first?.template else {
      return
    }
    
    interfaceController.pushTemplate(template, animated: true, completion: nil)
  }
  
  @objc(presentTemplate:)
  func presentTemplate(template: [TiCarplayTemplateProxy]) {
    guard let interfaceController, let template = template.first?.template else {
      return
    }
    
    interfaceController.presentTemplate(template, animated: true, completion: nil)
  }
  
  @objc(dismissTemplate:)
  func dismissTemplate(unused: [Any]?) {
    guard let interfaceController else {
      return
    }
    
    interfaceController.dismissTemplate(animated: true, completion: nil)
  }
}
