//
//  AccountVIewCardCell.swift
//  TestSnapKit
//
//  Created by Илья Казначеев on 23.05.2023.
//

import UIKit
import SnapKit

class AccountVIewCardCell: UICollectionViewCell {
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
}

private extension AccountVIewCardCell {
    
    func setup() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
