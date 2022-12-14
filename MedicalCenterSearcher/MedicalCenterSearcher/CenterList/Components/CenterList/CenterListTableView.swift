//
//  CenterListTableView.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import RxCocoa
import RxSwift
import SnapKit
import Then

class CenterListTableView: UITableView {

  private let disposeBag = DisposeBag()

  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)

    self.configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    self.backgroundColor = .systemBackground
    self.register(CenterListCell.self, forCellReuseIdentifier: CenterListCell.identifier)
    self.separatorStyle = .singleLine
  }

  func bind(viewModel: CenterListTableViewModel) {
    viewModel.cellData
      .drive(self.rx.items) { tableView, row, data in
        let index = IndexPath(row: row, section: 0)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CenterListCell.identifier, for: index) as? CenterListCell else {
          return CenterListCell()
        }

        cell.setData(with: data)
        cell.selectionStyle = .none
        return cell
      }.disposed(by: self.disposeBag)
  }
}
