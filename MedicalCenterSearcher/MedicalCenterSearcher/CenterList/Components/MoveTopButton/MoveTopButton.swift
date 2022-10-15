//
//  MoveTopButton.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/15.
//

import UIKit

final class MoveTopButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    self.configure()
    self.layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    self.backgroundColor = .systemBackground
    self.layer.cornerRadius = 30
    self.layer.shadowOpacity = 2
    self.layer.shadowOffset = CGSize(width: 0, height: 1)
    self.layer.shadowColor = UIColor.lightGray.cgColor
    self.setImage(UIImage(named: "top-alignment"), for: .normal)
  }

  private func layout() {
    self.snp.makeConstraints {
      $0.width.height.equalTo(60)
    }
  }
}
