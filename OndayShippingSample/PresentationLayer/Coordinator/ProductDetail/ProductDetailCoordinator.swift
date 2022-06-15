//
//  ProductDetailCoordinator.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import Foundation
import UIKit

protocol ProductDetailCoordinatorInterface {
  func showCart()
}

protocol ProductDetailRouterInterface {
  func showCart(navigation: UINavigationController, destination: UIViewController)
}

protocol ProductDetailContainerInterface {
  func makeCartViewController() -> UIViewController
}

final class ProductDetailCoordinator: ProductDetailCoordinatorInterface {
  private var rootNavigation: UINavigationController
  private let router: ProductDetailRouterInterface
  private let container: ProductDetailContainerInterface
  
  init(
    rootNavigation: UINavigationController,
    router: ProductDetailRouterInterface,
    container: ProductDetailContainerInterface
  ) {
    self.rootNavigation = rootNavigation
    self.router = router
    self.container = container
  }
  
  func showCart() {
    let destination = container.makeCartViewController()
    router.showCart(navigation: rootNavigation, destination: destination)
  }
}
