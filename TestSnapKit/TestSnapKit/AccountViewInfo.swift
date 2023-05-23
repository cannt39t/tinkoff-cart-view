//
//  AccountViewInfo.swift
//  TestSnapKit
//
//  Created by Илья Казначеев on 23.05.2023.
//

import UIKit

struct AccountViewInfo {
    
    let currency: Currency
    let amunt: Int
    let accountName: String
    let cards: [CardThymbnailInfo]
    
}

enum Currency {
    case rub
    case usd
    case eur
}

struct CardThymbnailInfo {
    let image: UIImage
    let id: String
}
