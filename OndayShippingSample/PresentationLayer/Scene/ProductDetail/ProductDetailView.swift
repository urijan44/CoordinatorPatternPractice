//
//  ProductDetailView.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import SwiftUI

struct ProductDetailView: View {
  @StateObject var viewModel: ViewModel
  var body: some View {
    VStack {
      Text("Hello, World!")
    }
  }
  
  init(viewModel: StateObject<ViewModel>) {
    self._viewModel = viewModel
  }
}

extension ProductDetailView {
  final class ViewModel: ObservableObject {
    private let coordinator: ProductDetailCoordinatorInterface
    
    func showCart() {
      coordinator.showCart()
    }
    
    init(coordinator: ProductDetailCoordinatorInterface) {
      self.coordinator = coordinator
    }
  }
}
