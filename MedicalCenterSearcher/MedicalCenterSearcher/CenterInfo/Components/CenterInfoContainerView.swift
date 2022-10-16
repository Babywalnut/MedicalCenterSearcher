//
//  CenterInfoContainerView.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/16.
//

import UIKit

class CenterInfoContainerView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    self.backgroundColor = .lightGray
  }
}
