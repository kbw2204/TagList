//
//  TagCollectionViewCell.swift
//  tagList
//
//  Created by 강병우 on 2020/11/19.
//

import UIKit

class TagCell: UICollectionViewCell {
  
  // MARK: - View
  
  let tagLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14)
    $0.textColor = .gray
  }
  
  // MARK: - layout
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(tagLabel)
    contentView.backgroundColor = .systemGray5
    contentView.layer.masksToBounds = true
    contentView.layer.cornerRadius = 4
    
    setConstraint()
  }
  
  func setConstraint() {
    tagLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
