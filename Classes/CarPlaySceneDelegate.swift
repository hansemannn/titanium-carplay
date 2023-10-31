//
//  SceneDelegate.swift
//  carplay_test_swift
//
//  Created by Hans Knöchel on 31.10.23.
//

import UIKit
import CarPlay

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
  
  private var interfaceController: CPInterfaceController?

  // MARK: Connect
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
  }
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController) {
    self.interfaceController = interfaceController
    
    // Item 1: Show child template
    let listItem1 = CPListItem(text: "List Item 1", detailText: "Hello world")
    listItem1.handler = { [weak self] (item, completion) in
      self?.interfaceController?.pushTemplate(CPListTemplate(title: "Show child template", sections: []), animated: true, completion: nil)
      completion()
    }
    
    // Item 2: Show alert template
    let listItem2 = CPListItem(text: "List Item 2", detailText: "Show alert template")
    listItem2.handler = { [weak self] (item, completion) in
      let alertTemplate = CPAlertTemplate(titleVariants: ["Test"], actions: [CPAlertAction(title: "Delete", style: .destructive, handler: { _ in
        self?.interfaceController?.dismissTemplate(animated: true, completion: nil)
        completion()
      })])
      self?.interfaceController?.presentTemplate(alertTemplate, animated: true, completion: nil)
    }

    // Item 3: Show info template
    let listItem3 = CPListItem(text: "List Item 3", detailText: "Show info template")
    listItem3.handler = { [weak self] (item, completion) in
      let infoTemplate = CPInformationTemplate(title: "Information", layout: .leading, items: [CPInformationItem(title: "Title", detail: "Subtitle")], actions: [CPTextButton(title: "Action", textStyle: .normal, handler: { _ in
        self?.interfaceController?.popTemplate(animated: true, completion: nil)
      })])
      
      self?.interfaceController?.pushTemplate(infoTemplate, animated: true, completion: nil)
      completion()
    }

    let section = CPListSection(items: [listItem1, listItem2, listItem3])
    let listTemplate = CPListTemplate(title: "Home", sections: [section])
    
    listTemplate.tabSystemItem = .featured
    listTemplate.showsTabBadge = false
    
    self.interfaceController?.setRootTemplate(listTemplate, animated: true, completion: nil)
  }
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController, to window: CPWindow) {
    
  }
  
  // MARK: Disconnect
  
  func sceneDidDisconnect(_ scene: UIScene) {
    
  }
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didDisconnect interfaceController: CPInterfaceController, from window: CPWindow) {
    
  }
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didDisconnectInterfaceController interfaceController: CPInterfaceController) {
    self.interfaceController = nil
  }
  
  // MARK: Select
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didSelect navigationAlert: CPNavigationAlert) {
    
  }
  
  func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didSelect maneuver: CPManeuver) {
    
  }
}

