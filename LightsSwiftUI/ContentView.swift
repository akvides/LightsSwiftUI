//
//  ContentView.swift
//  LightsSwiftUI
//
//  Created by Василий Полторак on 29.05.2022.
//

import SwiftUI

enum LightStatus {
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var buttonTitle = "Start"
    @State private var status: LightStatus?
    
    @State private var redLight = LightIndicator(color: .red)
    @State private var yellowLight = LightIndicator(color: .yellow)
    @State private var greenLight = LightIndicator(color: .green)
    
    var body: some View {
        ZStack{
            Color(.gray)
                .ignoresSafeArea()
            VStack{
                ZStack{
                    Color(.black)
                    VStack{
                        redLight
                        yellowLight
                        greenLight
                    }
                }
                .frame(width: 130, height: 350)
                .cornerRadius(16)
                
                Spacer()

                Button {
                    changeColor()
                } label:  {
                    Text(buttonTitle)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.horizontal, 80.0)
                        .padding(.vertical, 15.0)
                        
                }
                .background(.cyan)
                .cornerRadius(16)
                .padding(.bottom, 16)

            }
            
        }
    }
    
    private func changeColor() {
        switch status {
            
        case .red:
            redLight.state = false
            yellowLight.state = true
            status = .yellow
        case .yellow:
            yellowLight.state = false
            greenLight.state = true
            status = .green
        case .green:
            greenLight.state = false
            redLight.state = true
            status = .red
        case .none:
            buttonTitle = "Next"
            status = .red
            redLight.state = true
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
