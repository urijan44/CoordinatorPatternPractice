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
  func goDetail()
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
  
  func goDetail() {
    let destination = container.makeProductDetailViewController(coordinator: self)
    router.goProductDetail(navigation: rootNavigation, destination: destination)
  }
  
  func showCart() {
    let destination = container.makeCartViewController()
    if let presenter = rootNavigation.topViewController {
      router.showCart(navigation: nil, presenter: presenter, destination: destination)
    } else {
      router.showCart(navigation: rootNavigation, presenter: nil, destination: destination)
    }
  }
}
