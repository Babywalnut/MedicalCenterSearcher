//
//  CenterInfoContainerView.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/16.
//

import UIKit

import SnapKit

class CenterInfoContainerView: UIView {

  private let centerItemView = CenterInfoItemView(imageName: "hospital")
  private let buildingItemView = CenterInfoItemView(imageName: "building")
  private let phoneNumberItemVIew = CenterInfoItemView(imageName: "telephone")
  private let updateDateTimeItemView = CenterInfoItemView(imageName: "chat")
  private let addressItemView = CenterInfoItemView(imageName: "placeholder")

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.configure()
    self.layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    self.backgroundColor = .systemGray5
  }

  private func layout() {
    [
      self.centerItemView,
      self.buildingItemView,
      self.phoneNumberItemVIew,
      self.updateDateTimeItemView,
      self.addressItemView
    ].forEach {
      self.addSubview($0)
    }

    self.centerItemView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.top.equalToSuperview().offset(20)
      $0.width.equalToSuperview().dividedBy(2).inset(20)
      $0.height.equalToSuperview().dividedBy(4).inset(10)
    }

    self.buildingItemView.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-20)
      $0.top.equalToSuperview().offset(20)
      $0.width.equalToSuperview().dividedBy(2).inset(20)
      $0.height.equalToSuperview().dividedBy(4).inset(10)
    }

    self.phoneNumberItemVIew.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(20)
      $0.top.equalTo(self.centerItemView.snp.bottom).offset(20)
      $0.width.equalToSuperview().dividedBy(2).inset(20)
      $0.height.equalToSuperview().dividedBy(4).inset(10)
    }

    self.updateDateTimeItemView.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-20)
      $0.top.equalTo(self.buildingItemView.snp.bottom).offset(20)
      $0.width.equalToSuperview().dividedBy(2).inset(20)
      $0.height.equalToSuperview().dividedBy(4).inset(10)
    }

    self.addressItemView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(self.phoneNumberItemVIew.snp.bottom).offset(20)
      $0.width.equalToSuperview().inset(20)
      $0.height.equalToSuperview().dividedBy(4).inset(10)
    }
  }
}

