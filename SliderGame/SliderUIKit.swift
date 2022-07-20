//
//  SliderUIKit.swift
//  SliderGame
//
//  Created by Павел on 20.07.2022.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {

    @Binding var valueSlider: Double
    var opacitySlider: Double
    
    func makeUIView(context: Context) -> UISlider {
     
        let slider = UISlider()
        
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(.red).withAlphaComponent(opacitySlider)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(valueSlider: $valueSlider)
    }
    
}

extension SliderUIKit{
    
    class Coordinator: NSObject {
        @Binding private var valueSlider: Double
        
        init(valueSlider: Binding<Double>) {
            self._valueSlider = valueSlider
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            valueSlider = Double(sender.value)
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(valueSlider: .constant(50), opacitySlider: 0.5)
    }
}
