//
//  CheckboxStyle.swift
//  SBPWidget-demo-iOS
//
//  Created by Дмитрий Мельников on 03.02.2023.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .green : .secondary)
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
