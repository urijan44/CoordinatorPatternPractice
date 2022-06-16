//
//  CartView.swift
//  OndayShippingSample
//
//  Created by leehs81 on 2022/06/15.
//

import SwiftUI

protocol CartViewDelegate {
  func didTapShowDetail()
}

struct CartView: View {
  var delegate: CartViewDelegate?
  var body: some View {
    VStack {
      Text("여기는 카트뷰")
      Label("디테일", systemImage: "doc.text.magnifyingglass")
        .foregroundColor(Color(UIColor.red))
        .onTapGesture {
          delegate?.didTapShowDetail()
        }
    }
  }
  
  init(delegate: CartViewDelegate? = nil) {
    self.delegate = delegate
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
  }
}
