//
//  AppDIContainer.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit
import SwiftUI

protocol AppContainerInterface {
  func makeViewController(coordinator: AppCoordinatorInterface) -> UIViewController
  func makeCartViewController() -> UIViewController
  func makeProductDetailViewController(coordinator: ProductDetailCoordinatorInterface) -> UIViewController
}

struct DIContainer: AppContainerInterface {
  func makeViewController(coordinator: AppCoordinatorInterface) -> UIViewController {
    let vm = ViewModel(coordinator: coordinator)
    let vc = ViewController(viewModel: vm)
    return vc
  }
  
  func makeCartViewController() -> UIViewController {
    UIHostingController(rootView: CartView())
  }
  
  func makeProductDetailViewController(coordinator: ProductDetailCoordinatorInterface) -> UIViewController {
    @StateObject var viewModel = ProductDetailView.ViewModel(coordinator: coordinator)
    let view = ProductDetailView(viewModel: _viewModel)
    return UIHostingController(rootView: view)
  }
}
