//
//  ContentView.swift
//  VibgyorLoaderSwiftUI
//
//  Created by Alok Sagar on 27/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var isAnimating:Bool = false
    @State var rotAngle = 0
    var body: some View {
        ZStack {
            ForEach(0..<7) { index in
                VibgyorBubble(rotationAngle: Double(360/7*index+rotAngle), offSetY: isAnimating ? 120 : 00, bubbleIndex: index)
             }
            ForEach(0..<7) { index in
                VibgyorBubble(rotationAngle: Double(360/7*index+rotAngle), offSetY: isAnimating ? 60 : 00, bubbleIndex: index)
             }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(Color.black)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                    isAnimating = true
                }
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                   rotAngle = 360
                }
                
                
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VibgyorBubble: View {
    var rotationAngle:Double = 0
    var offSetY:Double = 0
    var bubbleIndex:Int = 0
    var body: some View {
        Circle().fill(Color.getVibgyor(at: bubbleIndex)).frame(width: 20, height: 20).offset(y:offSetY).rotationEffect(.degrees(rotationAngle))
    }
}

extension Color {
    
    static func getVibgyor(at index:Int) -> Color{
        
        switch index {
        case 0:
            return Color.init(red: 143, green: 0, blue: 255)
        case 1:
            return .indigo
        case 2 :
            return .blue
        case 3 :
            return .green
        case 4 :
            return .yellow
        case 5 :
            return .orange
        case 6 :
            return .red
        default:
            return .white
        }
        
        
        
    }
    
}
