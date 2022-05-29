//
//  LightIndicator.swift
//  LightsSwiftUI
//
//  Created by Василий Полторак on 29.05.2022.
//

import SwiftUI

struct LightIndicator: View {
    let color: Color
    
    var state = false
    
    var body: some View {
        
        if state {
            Circle()
                .foregroundColor(color)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .frame(width: 100, height: 100)
                
                
        } else {
            Circle()
                .foregroundColor(color)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .overlay(
                    Circle()
                        .foregroundColor(.blue)
                        .luminanceToAlpha()
                )
                .frame(width: 100, height: 100)
        }
            
            
        

    }
}

struct LightIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LightIndicator(color: .yellow)
    }
}
