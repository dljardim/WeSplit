//
//  _DevNotes.swift
//  WeSplit
//
//  Created by Damian Jardim on 2/27/25.
//

import SwiftUI

struct _DevNotes: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

}

#Preview {
    _DevNotes()
}
