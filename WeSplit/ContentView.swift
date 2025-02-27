//
//  ContentView.swift
//  WeSplit
//
//  Created by Damian Jardim on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount:Double = 0.00
    @State private var numberOfPeople:Int = 1
    @State private var tipPercentage:Int = 0
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    

    func calculateAmountPerPerson()->Double{
        if(checkAmount > 0.00 && numberOfPeople > 0){
            return (checkAmount / Double(numberOfPeople))
        } else{
            return 0.00
        }
    }
    
    var totalPerPerson:Double{
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Enter Check Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(1..<100){num in
                            Text("\(num)").tag(num)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section{
                    
                    Text("How much do you want to tip?")
                    
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){ num in
                            Text(num, format: .percent)
                        }
                        
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: tipPercentage){
                        print("tipPercentageChanged")
                    }
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            //show done top right
            .toolbar{
                if(amountIsFocused){
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
                
        }
    }
}



#Preview {
    ContentView()
}

