//
//  ViewController.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit

final class ViewController: UIViewController {
  
  let rootView = RootView()
  private var viewModel: ViewModel!

  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.viewModel = nil
  }
  
  required init?(coder: NSCoder) {
    fatalError("")
  }
  
  override func loadView() {
    rootView.delegate = self
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

extension ViewController: RootViewDelegate {
  func cartButtonAction() {
    viewModel.goCart()
  }
  
  func detailButtonAction() {
    viewModel.goDetail()
  }
}


