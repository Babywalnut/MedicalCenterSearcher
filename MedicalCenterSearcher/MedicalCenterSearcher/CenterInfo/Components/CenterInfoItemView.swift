//
//  CenterInfoItemView.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/16.
//

import UIKit

import SnapKit
import Then

class CenterInfoItemView: UIView {

  private let categoryImageView = UIImageView()
  private let keyLabel = UILabel()
  private let valueLabel = UILabel()
  private let imageName: String

  init(imageName: String) {
    self.imageName = imageName
    super.init(frame: .zero)

    self.configure()
    self.attribute()
    self.layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    self.backgroundColor = .systemBackground
    self.layer.cornerRadius = 7
    self.layer.shadowOpacity = 2

    self.layer.shadowOffset = CGSize(width: 3, height: 7)
    self.layer.shadowColor = UIColor.systemGray.cgColor
  }

  private func attribute() {
    self.categoryImageView.do {
      $0.image = UIImage(named: self.imageName)
      $0.backgroundColor = .systemBackground

    }

    self.keyLabel.do {
      $0.font = .systemFont(ofSize: 20, weight: .bold)
      $0.textColor = .black
      $0.text = "123"
    }

    self.valueLabel.do {
      $0.font = .systemFont(ofSize: 14, weight: .regular)
      $0.textColor = .black
      $0.text = "213124"
    }
  }

  private func layout() {
    [
      self.categoryImageView,
      self.keyLabel,
      self.valueLabel,

    ].forEach {
      self.addSubview($0)
    }

    [
      self.categoryImageView,
    ].forEach {
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().inset(30)
        make.height.equalToSuperview().dividedBy(3)
        make.width.equalTo(self.snp.height).dividedBy(3)
        make.centerX.equalToSuperview()
      }
    }

    [
      self.keyLabel,
    ].forEach {
      $0.snp.makeConstraints { make in
        make.centerX.equalToSuperview()
        make.centerY.equalToSuperview().offset(20)
      }
    }

    [
      self.valueLabel,
    ].forEach {
      $0.snp.makeConstraints { make in
        make.bottom.equalToSuperview().inset(30)
        make.centerX.equalToSuperview()
      }
    }

  }
}
