//
//  ContentView.swift
//  rsanumberalgorithminterface
//
//  Created by Nathan Smith on 2022-04-23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored Properties
    @State var providedInput = ""
    
    // MARK: Computed Properties
    var input: Double? {
        guard let input =
                Double(providedInput),
              input > 0
        else {
            // When the tested are failed, we do not have a valid radius
            return nil
        }
        return input
    }
    
    var body: some View {
        VStack {
            TextField("Radius",
                      text: $providedInput,
                      prompt: Text("input here"))
            // Ternary conditional operator
            // "One line if statement"
            //                     CONDITION        TRUE          FALSE
            .foregroundColor(input == nil ? Color.red : Color.primary)
            
            Text(String(input ?? 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
