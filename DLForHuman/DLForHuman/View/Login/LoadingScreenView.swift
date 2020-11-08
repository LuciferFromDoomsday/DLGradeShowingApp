//
//  LoadingScreenView.swift
//  DLForHuman
//
//  Created by admin on 7/20/20.
//  Copyright © 2020 Naimankhan Ayan. All rights reserved.
//

import SwiftUI

struct LoadingScreenView: View {
    @State var animate = false
    var body: some View {
        VStack{
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(AngularGradient(gradient: .init(colors: [.red , .white]) , center: .center) , style: StrokeStyle(lineWidth: 8 , lineCap: .round))
            .frame(width: 45, height: 45)
            .rotationEffect(.init(degrees: self.animate ? 360:0))
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
            Text("Loading...").padding(.top)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(15)
        .onAppear() {
            self.animate.toggle()
        }
    }
}


