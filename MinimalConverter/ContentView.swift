//
//  ContentView.swift
//  MinimalConverter
//
//  Created by Nicolas Papegaey on 15/12/2020.
//

import SwiftUI

struct ContentView: View {
    let volumeUnits = ["Millilitre", "Centilitre", "Litre", "Pinte", "Gallon"]
    let volumeRatio = [1.0, 10.0, 1000.0, 473.0, 4546.0]

    
    var convertedVolume: Double {
        let valueToConvert = Double(inputValue) ?? 0
        let baseValue = valueToConvert * volumeRatio[inputUnitSelected]
        let convertedValue = baseValue / volumeRatio[outputUnitSelected]
        
        return convertedValue
    }
    
    @State private var conversionTypeSelected = 0
    @State private var inputValue = ""
    @State private var inputUnitSelected = 0
    @State private var outputUnitSelected = 0

    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Unité source")) {
                    Picker("Unité source", selection: $inputUnitSelected) {
                        ForEach(0 ..< volumeUnits.count) {
                            Text("\(self.volumeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                TextField("Valeur à convertir", text: $inputValue)
                Section(header: Text("Unité cible")) {
                    Picker("Unité source", selection: $outputUnitSelected) {
                        ForEach(0 ..< volumeUnits.count) {
                            Text("\(self.volumeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Résultat")) {
                    Text("\(convertedVolume, specifier: "%.2f")")
                }
            }
            .navigationTitle("Minimal Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
