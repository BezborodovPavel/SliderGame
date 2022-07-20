//
//  ContentView.swift
//  SliderGame
//
//  Created by Павел on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = 0
    @State private var sliderValue = 0.0
    @State private var capacitySlider = 0.5
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к \(targetValue)")
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding()
            HStack {
                Text("1")
                SliderUIKit(capacitySlider: $capacitySlider, valueSlider: $sliderValue)
                    .onChange(of: sliderValue) { newValue in
                        capacitySlider = Double(computeScore()) / 100.0
                    }
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
        .onAppear(perform: startButtonPress) // Так при запуске рандомное число устанавливается. Но есть сомнения правильно ли тут это делать.
        .alert("Your score", isPresented: $alertPresented, actions: {}) {
            Text("\(computeScore())")
        }
        
    }

//    А вот так не работает, хотя метод и срабатывает, но targetValue остается равным 0 и при зауске приложения всегда начинается с этого числа. Как парильно здесь поступить?
//    init() {
//        startButtonPress()
//    }
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
