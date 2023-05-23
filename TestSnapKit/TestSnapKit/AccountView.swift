//
//  AccountView.swift
//  TestSnapKit
//
//  Created by Илья Казначеев on 23.05.2023.
//

import UIKit
import SnapKit


class AccountView: UIView {
    
    func configure(with info: AccountViewInfo) {
        currencySignImageView.image = makeCurrencyImage(for: info.currency)
        amountLabel.text = makeAmountLabelText(for: info.currency, amount: info.amunt)
        accountNameLabel.text = info.accountName
        cards = info.cards
        collectionView.reloadData()
    }
    
    private let currencySignImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: UIConstants.amountLabelFontSize)
        return label
    }()
    
    private let accountNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private var collectionView: UICollectionView!
    
    
    private enum UIConstants {
        static let cardWidth: CGFloat = 45
        static let cardHeight: CGFloat = 30
        static let contentInset: CGFloat = 16
        static let currencySignImageSize: CGFloat = 30
        static let cornerRadius: CGFloat = 30
        static let xStackSpacing: CGFloat = 16
        static let yStackSpacing: CGFloat = 4
        static let cardsToAccountNameSpacing: CGFloat = 12
        static let amountLabelFontSize: CGFloat = 17
    }
    
    private var cards: [CardThymbnailInfo] = []
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AccountView {
    
    func setup() {
        backgroundColor = UIColor(named: "TinkoffViewsColor")
        layer.cornerRadius = UIConstants.cornerRadius
        let yStack = UIStackView()
        yStack.axis = .vertical
        yStack.spacing = UIConstants.yStackSpacing
        yStack.addArrangedSubview(amountLabel)
        yStack.addArrangedSubview(accountNameLabel)
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AccountVIewCardCell.self, forCellWithReuseIdentifier: String(describing: AccountVIewCardCell.self))
        yStack.addArrangedSubview(collectionView)
        
        yStack.setCustomSpacing(UIConstants.cardsToAccountNameSpacing, after: accountNameLabel)
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.cardHeight)
        }
        
        currencySignImageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.currencySignImageSize)
        }
        
        let xStack = UIStackView()
        xStack.spacing = UIConstants.xStackSpacing
        xStack.alignment = .top
        xStack.axis = .horizontal
        xStack.addArrangedSubview(currencySignImageView)
        xStack.addArrangedSubview(yStack)
        addSubview(xStack)
        
        xStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIConstants.contentInset)
        }
    }
    
    func makeCurrencyImage(for currency: Currency) -> UIImage? {
        switch currency {
            case .usd:
                return UIImage(systemName: "star")!
            case .rub:
                return UIImage(systemName: "star")!
            case .eur:
                return UIImage(systemName: "star")!
        }
    }
    
    func makeAmountLabelText(for currency: Currency, amount: Int) -> String {
        var currencySign: String {
            switch currency {
                case .eur:
                    return "$"
                case .rub:
                    return "€"
                case .usd:
                    return "₽"
            }
        }
        return "\(amount) \(currencySign)"
    }
}

extension AccountView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AccountVIewCardCell.self), for: indexPath) as! AccountVIewCardCell
        let image = cards[indexPath.item].image
        cell.configure(with: image)
        return cell
    }
}

extension AccountView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cardWidth, height: UIConstants.cardHeight)
    }
}


