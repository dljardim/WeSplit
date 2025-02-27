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
            } // form
        } // navigation stack
    }
}

// if let to check for nil values
struct ContentView_IfLet: View {
    
    @State private var selectedName:String?
    
    let names:[String] = ["Ted", "Buddy", "Freddie", "Roxanne", "Amber"]
    
    var body: some View{
        
        // if let
        if let sName = selectedName{
            Text(sName)
                .font(.headline)
                .padding()
        } else {
            Text("Select a name")
                .font(.headline)
                .padding()
        }
        
        List{
            ForEach(names, id: \.self){name in
                Text(name).onTapGesture {
                    selectedName = name
                }
            }
        }
    }
}

// Nil-Coalescing Operator ?? using optional string
struct ContentView_NilCoalescing_Optional: View {
    let names = ["Ted", "Buddy", "Freddie", "Roxanne", "Amber"]
    @State private var selectedName: String? = nil
    
    var body: some View {
        VStack {
            Text(selectedName ?? "Select a name")
                .font(.headline)
                .padding()
            
            List(names, id: \.self) { name in
                Text(name)
                    .onTapGesture {
                        selectedName = name
                    }
            } // list
        } // vstack
    }
}

// Empty string comparison
struct ContentView_EmptyStringInitializer: View {
    
    @State private var selectedName:String = ""
    
    let names:[String] = ["Ted", "Buddy", "Freddie", "Roxanne", "Amber"]
    
    var body: some View {
        
        Text(selectedName.isEmpty ? "Select a name" : "Selected: \(selectedName)")
            .font(.headline)
            .padding()
        
        List{
            ForEach(names, id: \.self){name in
                Text(name).onTapGesture {
                    selectedName = name
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

/* *************************************
 
 VStack{
 ForEach(names, id: \.self){name in
 Text("\(name)").onTapGesture {
 print("Selected: \(name)")
 }
 }
 }
 
 **************************************/
