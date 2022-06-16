//
//  CartViewController.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/16.
//

import UIKit
import SwiftUI

final class CartViewController: UIViewController {
  private var coordinator: AppCoordinatorInterface!
  
  init(coordinator: AppCoordinatorInterface) {
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    coordinator = nil
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let rootView = CartView(delegate: self)
    let hosting = UIHostingController(rootView: rootView)
    addChild(hosting)
    view.addSubview(hosting.view)
    hosting.view.frame = view.frame
  }
}

extension CartViewController: CartViewDelegate {
  func didTapShowDetail() {
    coordinator.goDetail(source: self)
  }
}
