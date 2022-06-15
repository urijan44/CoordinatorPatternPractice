//
//  RootView.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import UIKit

protocol RootViewDelegate: AnyObject {
  func cartButtonAction()
  func detailButtonAction()
}

final class RootView: UIView {
  
  private lazy var label = UILabel()
  private lazy var cartButton: UIButton = {
    var configuration = UIButton.Configuration.bordered()
    configuration.title = "카트"
    configuration.image = UIImage(systemName: "cart.fill")
    let uiAction = UIAction(handler: didTapGoCart(_:))
    let button = UIButton(configuration: configuration, primaryAction: uiAction)
    return button
  }()
  
  private lazy var detailButton: UIButton = {
    var configuration = UIButton.Configuration.bordered()
    configuration.title = "디테일"
    configuration.image = UIImage(systemName: "doc.text.magnifyingglass")
    let uiAction = UIAction(handler: didTapGoDetail(_:))
    let button = UIButton(configuration: configuration, primaryAction: uiAction)
    return button
  }()
  
  weak var delegate: RootViewDelegate?
    
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    addSubview(label)
    label.text = "한국어 어캐 짤리냐고"
    label.lineBreakMode = .byTruncatingTail
    addSubview(cartButton)
    addSubview(detailButton)
    layoutConfigure()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  private func layoutConfigure() {
    label.frame.size = CGSize(width: 200, height: 80)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    cartButton.bounds.size = CGSize(width: 100, height: 40)
    cartButton.translatesAutoresizingMaskIntoConstraints = false
    cartButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    cartButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
    
    detailButton.bounds.size = CGSize(width: 100, height: 40)
    detailButton.translatesAutoresizingMaskIntoConstraints = false
    detailButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    detailButton.topAnchor.constraint(equalTo: cartButton.bottomAnchor, constant: 10).isActive = true
  }
  
  private func didTapGoCart(_ action: UIAction) {
    delegate?.cartButtonAction()
  }
  
  private func didTapGoDetail(_ action: UIAction) {
    delegate?.detailButtonAction()
  }
}
