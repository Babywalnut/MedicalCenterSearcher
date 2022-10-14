//
//  CenterListCell.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift
import SnapKit
import Then

final class CenterListCell: UITableViewCell {

  private let centerNameKeyLabel = UILabel()
  private let buildingNameKeyLabel = UILabel()
  private let addressKeyLabel = UILabel()
  private let updateDateTimeKeyLabel = UILabel()

  private let centerNameValueLabel = UILabel()
  private let buildingNameValueLabel = UILabel()
  private let addressValueLabel = UILabel()
  private let updateDateTimeValueLabel = UILabel()

  private let keyValueDistributionStackView = UIStackView()
  private let centerInfoKeyStackView = UIStackView()
  private let centerInfoValueStackView = UIStackView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.attribute()
    self.layout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func attribute() {
    self.keyValueDistributionStackView.do {
      $0.axis = .horizontal
      $0.alignment = .fill
      $0.distribution = .fillProportionally
    }

    self.centerInfoKeyStackView.do {
      $0.axis = .vertical
      $0.alignment = .leading
      $0.distribution = .fillEqually
    }

    self.centerInfoValueStackView.do {
      $0.axis = .vertical
      $0.alignment = .leading
      $0.distribution = .fillEqually
    }
  }

  private func layout() {
    [
      self.centerInfoKeyStackView,
      self.centerInfoValueStackView
    ].forEach {
      self.keyValueDistributionStackView.addArrangedSubview($0)
    }

    [
      self.centerNameKeyLabel,
      self.buildingNameKeyLabel,
      self.addressKeyLabel,
      self.updateDateTimeKeyLabel
    ].forEach {
      self.centerInfoKeyStackView.addArrangedSubview($0)
    }

    [
      self.centerNameValueLabel,
      self.buildingNameValueLabel,
      self.addressValueLabel,
      self.updateDateTimeValueLabel
    ].forEach {
      self.centerInfoValueStackView.addArrangedSubview($0)
    }

    self.keyValueDistributionStackView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview().inset(10)
    }

    self.centerInfoKeyStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(1/3)
    }

    self.centerInfoValueStackView.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }
}
