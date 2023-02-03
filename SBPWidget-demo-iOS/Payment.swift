//
//  Payment.swift
//  SBPWidget-demo-iOS
//
//  Created by Дмитрий Мельников on 03.02.2023.
//

import Foundation

enum Payment: String, Identifiable {
    case unknown
    case cash = "Наличными"
    case card = "Картой онлайн"
    case sbp = "СБП"
    
    var id: String {
        rawValue
    }
    
    static var all: [Self] {
        [.cash, .card, .sbp]
    }
    
    var confirmButtonTitle: String {
        switch self {
       
        case .card, .sbp:
            return "Оплатить"
        
        case .cash, .unknown:
            return "Подтвердить"
        }
    }
    
    var url: String {
        switch self {
            
        case .sbp:
            return "https://qr.nspk.ru/AS100001ORTF4GAF80KPJ53K186D9A3G?type=01&bank=100000000007&crc=0C8A"
            
        default:
            return ""
        }
    }
}
