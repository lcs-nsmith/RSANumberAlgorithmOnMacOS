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
    let lowerBound = 2
    @State var howManyRSANumbers = 0
    
    // MARK: Computed Properties
    var input: Int? {
        guard let input =
                Int(providedInput),
              input > 0
        else {
            // When the tested are failed, we do not have a valid radius
            return nil
        }
        return input
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                TextField("Radius",
                          text: $providedInput,
                          prompt: Text("input here"))
                // Ternary conditional operator
                // "One line if statement"
                //                     CONDITION        TRUE          FALSE
                .foregroundColor(input == nil ? Color.red : Color.primary)
                
                
                Button(action: {
                    runAlgorithm()
                }, label: {
                    Text("Run Algorithm")
                })
                .buttonStyle(.bordered)
            }
            HStack {
                Text("Input:")
                Text(String(input ?? 0))
            }
            HStack {
                Text("RSA Number Count:")
                Text(String(howManyRSANumbers))
            }
            Spacer()
        }
    }
    func runAlgorithm() {
        for n in min(lowerBound,2)...(input!) {
            var divisors = 1
            for j in 1...n/2 {
                if n.isMultiple(of: j) {
                    divisors += 1
                }
            }
            if divisors == 4 {
                howManyRSANumbers += 1
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
