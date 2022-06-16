//
//  AppRouter.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit


protocol AppRouterInterface {
  func showCart(navigation: UINavigationController?, presenter: UIViewController?, destination: UIViewController)
  func goProductDetail(source: UIViewController, destination: UIViewController)
}

final class AppRouter: AppRouterInterface {
  func showCart(navigation: UINavigationController?, presenter: UIViewController?, destination: UIViewController) {
    if let rootNavigation = navigation {
      rootNavigation
        .pushViewController(destination, animated: true)
    } else if let presenter = presenter {
      presenter.present(destination, animated: true)
    }
  }
  
  func goProductDetail(source: UIViewController, destination: UIViewController) {
    
    if let navigation = source as? UINavigationController {
      navigation.pushViewController(destination, animated: true)
    } else {
      source.present(destination, animated: true)
    }
  }
}
