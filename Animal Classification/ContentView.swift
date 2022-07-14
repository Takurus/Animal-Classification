//
//  ContentView.swift
//  Animal Classification
//
//  Created by Jack Farray on 2022-07-12.
//

import SwiftUI
import CoreML

func testModel() ->
AnimalClassifierOutput? {
    
    do {
        
        let config = MLModelConfiguration()
        let model = try AnimalClassifier(configuration: config)
        let predicition = try model.prediction(hair: 0, feathers: 0, eggs: 0, milk: 1, airborne: 0, aquatic: 1, predator: 0, toothed: 1, backbone: 1, breathes: 1, venomous: 0, fins: 1, legs: 0, tail: 1, domestic: 0, catsize: 0)
        
        return predicition
        
    } catch {
        
    }
    
    return nil
}

struct ContentView: View {
    
    let predictedClass = testModel()!.class_type
    
    var body: some View {
        
        let predictedAccuracy = testModel()!.class_typeProbability[1]
        
        VStack {
        
            Text("Animal Prediction")
                .padding()
            
            Text(String(predictedAccuracy ?? 0))
        }.font(.system(size: 60))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
