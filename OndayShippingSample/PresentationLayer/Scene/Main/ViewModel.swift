//
//  ViewModel.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit

final class ViewModel {
  
  private let coordinator: AppCoordinatorInterface
  
  init(coordinator: AppCoordinatorInterface) {
    self.coordinator = coordinator
  }
  
  func goCart() {
    coordinator.showCart()
  }
  
  func goDetail() {
    coordinator.goDetail()
  }
}


