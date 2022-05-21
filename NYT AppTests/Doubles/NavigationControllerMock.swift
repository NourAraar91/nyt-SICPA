//
//  NavigationControllerMock.swift
//  NYT AppTests
//
//  Created by Nour Araar on 5/21/22.
//

import UIKit


class NavigationControllerMock: UINavigationController {
  var lastPushedViewController: UIViewController?

  override func pushViewController(
    _ viewController: UIViewController,
    animated: Bool) {

      lastPushedViewController = viewController
      super.pushViewController(viewController,
                               animated: animated)
    }

}
