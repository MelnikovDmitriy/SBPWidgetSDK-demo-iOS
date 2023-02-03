//
//  WidgetView.swift
//  SBPWidget-demo-iOS
//
//  Created by Дмитрий Мельников on 03.02.2023.
//

import SwiftUI

struct WidgetView: UIViewControllerRepresentable {
    let widgetViewController: UIViewController
    
    func makeUIViewController(context: Context) -> UIViewController {
        widgetViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
