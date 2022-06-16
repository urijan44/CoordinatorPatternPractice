//
//  AppCoordinator.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit
import SwiftUI

protocol AppCoordinatorInterface {
  func start(window: UIWindow)
  func showCart()
  func goDetail(source: UIViewController?)
}

final class AppCoordinator: AppCoordinatorInterface, ProductDetailCoordinatorInterface {
  private var rootNavigation = UINavigationController()
  private var container: AppContainerInterface = DIContainer()
  private var router: AppRouterInterface = AppRouter()
  
  func start(window: UIWindow) {
    let destination = container.makeViewController(coordinator: self)
    rootNavigation.pushViewController(destination, animated: false)
    window.rootViewController = rootNavigation
    window.makeKeyAndVisible()
  }
  
  func goDetail(source: UIViewController? = nil) {
    let destination = container.makeProductDetailViewController(coordinator: self)
    router.goProductDetail(source: source == nil ? rootNavigation : source!, destination: destination)
  }
  
  func showCart() {
    let destination = container.makeCartViewController(coordinator: self)
    if let presenter = rootNavigation.topViewController {
      router.showCart(navigation: nil, presenter: presenter, destination: destination)
    } else {
      router.showCart(navigation: rootNavigation, presenter: nil, destination: destination)
    }
  }
}
