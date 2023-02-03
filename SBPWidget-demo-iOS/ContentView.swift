//
//  ContentView.swift
//  SBPWidget-demo-iOS
//
//  Created by Дмитрий Мельников on 03.02.2023.
//

import SwiftUI
import SBPWidget

struct ContentView: View {
    let widget = SBPWidgetSDK.shared
    
    @State var selecledPayment = Payment.sbp
    @State var isWidgetLinkActive = false
    @State var isAlertPresented = false
    
    @ViewBuilder var widgetView: some View {
        if isWidgetLinkActive,
           let viewController = try? widget.bankListViewController(paymentURL: selecledPayment.url) {
            WidgetView(widgetViewController: viewController)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Подтверждение заказа:")
                
                Divider()
                
                HStack(spacing: 16) {
                    Color.black
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Чёный квадрат")
                            .font(.headline)
                        
                        Text("Каземир Малевич")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("1 шт / 1990 ₽")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                Divider()
                
                HStack {
                    Text("Итого:")
                    
                    Spacer()
                    
                    Text("1990 ₽")
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Варианты оплаты:")
                    
                    ForEach(Payment.all) { payment in
                        Toggle(payment.rawValue, isOn: .init(
                            get: { selecledPayment == payment },
                            set: { _ in selecledPayment = payment }
                        ))
                        .toggleStyle(CheckboxStyle())
                        .font(.subheadline)
                    }
                }
                
                Divider()
                
                VStack {
                    Spacer()
                    
                    Button(action: confirmButtonAction) {
                        Text(selecledPayment.confirmButtonTitle)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .background(
                NavigationLink(
                    "",
                    isActive: $isWidgetLinkActive,
                    destination: { widgetView }
                )
            )
            .alert(
                "Упс",
                isPresented: $isAlertPresented,
                actions: {},
                message: {
                    Text("Мы здесь не за этим 🙂")
                }
            )
        }
    }
    
    func confirmButtonAction() {
        switch selecledPayment {
            
        case .sbp:
            isWidgetLinkActive = true
            
        default:
            isAlertPresented = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
