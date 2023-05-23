//
//  ViewController.swift
//  TestSnapKit
//
//  Created by Илья Казначеев on 23.05.2023.
//

import UIKit
import SnapKit

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setup()
//    }
//
//    func setup() {
//        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
//
//        let label = UILabel()
//        label.text = "🎉 Welcome!"
//        label.font = .systemFont(ofSize: 20)
//        label.textColor = .black
//        view.addSubview(label)
//
//        label.snp.makeConstraints { make in
//            make.left.equalToSuperview().inset(50)
//            make.top.equalToSuperview().inset(150)
//        }
//
//        let extraLabel = UILabel()
//        extraLabel.textColor = .black
//        extraLabel.numberOfLines = 0
//        extraLabel.text = "Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text Extra text text Extratext Extratext Extratext Extra"
//        view.addSubview(extraLabel)
//        extraLabel.snp.makeConstraints { make in
//            make.left.right.equalToSuperview().inset(50)
//            make.top.equalTo(label).inset(50)
//        }
//
//        let button = UIButton(type: .system)
//        button.layer.cornerRadius = 20
//        button.layer.masksToBounds = true
//        button.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
//        button.setTitle("Get your username ->", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        view.addSubview(button)
//
//        button.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalTo(250)
//            make.bottom.equalToSuperview().inset(50)
//            make.height.equalTo(50)
//        }
//    }
//}


class ViewController: UIViewController {
    

    
    let accountView = AccountView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private let currencySignImageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let accountNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var collectionView: UICollectionView!
    
    func setup() {
        let info = AccountViewInfo(currency: .rub, amunt: 123, accountName: "Tinkoff Black Metal", cards: [
            CardThymbnailInfo(image: UIImage(named: "card")!, id: "id1"),
            CardThymbnailInfo(image: UIImage(named: "card")!, id: "id1")
        ])
        
        accountView.configure(with: info)
        view.backgroundColor = UIColor(named: "TinkoffBackGroundColor")
        view.addSubview(accountView)
        accountView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
}
