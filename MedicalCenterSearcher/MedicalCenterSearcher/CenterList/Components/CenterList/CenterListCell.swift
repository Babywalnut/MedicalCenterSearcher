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

  static let identifier = "CenterListCell"

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
    self.backgroundColor = .white
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func attribute() {
    [
      self.centerNameKeyLabel,
      self.buildingNameKeyLabel,
      self.addressKeyLabel,
      self.updateDateTimeKeyLabel
    ].forEach {
      $0.do { label in
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
      }
    }

    [
      self.centerNameValueLabel,
      self.buildingNameValueLabel,
      self.addressValueLabel,
      self.updateDateTimeValueLabel
    ].forEach {
      $0.do { label in
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
      }
    }

    self.keyValueDistributionStackView.do {
      $0.axis = .horizontal
      $0.alignment = .fill
      $0.distribution = .fillProportionally
    }

    self.centerInfoKeyStackView.do {
      $0.axis = .vertical
      $0.alignment = .leading
      $0.distribution = .fillEqually
      $0.spacing = 10
    }

    self.centerInfoValueStackView.do {
      $0.axis = .vertical
      $0.alignment = .leading
      $0.distribution = .fillEqually
      $0.spacing = 10
    }
  }

  private func layout() {
    self.contentView.addSubview(self.keyValueDistributionStackView)

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
      $0.top.leading.bottom.trailing.equalTo(self.contentView).inset(10)
    }

    self.centerInfoKeyStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.equalToSuperview().dividedBy(4)
    }

    self.centerInfoValueStackView.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.trailing.equalToSuperview()
    }
  }

  func setData(with data: CenterListData) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    self.centerNameKeyLabel.text = "센터명"
    self.buildingNameKeyLabel.text = "건물명"
    self.addressKeyLabel.text = "주소"
    self.updateDateTimeKeyLabel.text = "업데이트 시간"
    self.centerNameValueLabel.text = data.centerName
    self.buildingNameValueLabel.text = data.facilityName
    self.addressValueLabel.text = data.address
    self.updateDateTimeValueLabel.text = dateFormatter.string(from: data.updateAt)
  }
}
