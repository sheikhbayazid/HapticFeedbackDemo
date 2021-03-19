//
//  ContentView.swift
//  HapticDemo
//
//  Created by Sheikh Bayazid on 8/10/20.
//  Copyright © 2020 Sheikh Bayazid. All rights reserved.
//

import SwiftUI

struct HapticButtonStyle: ButtonStyle {
    var start: CGFloat = 0.95
    var end: CGFloat = 1.15
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? start : end)
    }
}

struct ButtonView: View {
    var title: String
    var hapticStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium
    var frameSize: CGFloat = 115
    var fontSize: CGFloat = 22
    var start: CGFloat = 0.85
    var end: CGFloat = 1.15
    
    var body: some View {
        VStack {
            Button(action: {
                triggerHaptic(style: hapticStyle)
            }, label: {
                Text(title)
                    .font(.system(size: fontSize))
                    .foregroundColor(Color.black.opacity(0.85))
                    .shadow(color: .gray, radius: 2)
                    .frame(width: frameSize, height: 45)
                    .background(Color.white.opacity(0.65))
                    .cornerRadius(30)
                    .shadow(color: .black, radius: 4, x: -2, y: -2)
                    .shadow(color: .gray, radius: 2, x: 1, y: 1)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 3.5))
                
            }).buttonStyle(HapticButtonStyle(start: start, end: end))
            
        }
    }
    
    func triggerHaptic(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let haptic = UIImpactFeedbackGenerator(style: style)
        haptic.impactOccurred()
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 25/255, green: 25/255, blue: 25/255).edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text(" Haptic Feedback")
                        .font(.system(size: 22))
                        .foregroundColor(Color.black.opacity(0.9))
                        .shadow(color: .gray, radius: 2)
                        .frame(width: 190, height: 55)
                        .background(Color.white.opacity(0.65))
                        .cornerRadius(10)
                        .shadow(color: .black, radius: 4, x: -2, y: -2)
                        .shadow(color: .gray, radius: 4, x: 2, y: 2)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 3.5))
                    
                }.offset(y: 20)
                
                Spacer()
                
                VStack(spacing: 30) {
                    
                    ButtonView(title: "Heavy", hapticStyle: .heavy, start: 0.85, end: 1.15)
                    
                    ButtonView(title: "Medium", hapticStyle: .medium, frameSize: 110, fontSize: 20, start: 0.9, end: 1.1)
                    
                    ButtonView(title: "Rigit", hapticStyle: .rigid, frameSize: 105, fontSize: 18, start: 0.94, end: 1.08)
                    
                    ButtonView(title: "Light", hapticStyle: .light, frameSize: 95, fontSize: 16, start: 0.95, end: 1.05)
                    
                    ButtonView(title: "Soft", hapticStyle: .soft, frameSize: 90, fontSize: 15.5, start: 0.975, end: 1.025)
                }
                .frame(width: 300, height: 420)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .offset(y: 20)
                
                Spacer()
                
            }
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
