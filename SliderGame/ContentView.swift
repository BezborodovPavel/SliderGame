//
//  ContentView.swift
//  SliderGame
//
//  Created by Павел on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var sliderValue = 0.0
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding()
            HStack {
                Text("1")
                SliderUIKit(valueSlider: $sliderValue, opacitySlider: Double(computeScore()) / 100.0)
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                checkButtonPress()
            }
            .padding()
            Button("Начать заново") {
                startButtonPress()
            }
        }
        .alert("Your score", isPresented: $alertPresented, actions: {}) {
            Text("\(computeScore())")
        }
    }
}

extension ContentView {
    private func startButtonPress(){
        self.targetValue = Int.random(in: 1...100)
    }
}

extension ContentView {
    private func checkButtonPress(){
        alertPresented = true
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
