import SwiftUI


 /* *************************************************
 Questions for You:
 What happens when you type in the TextFields?
 - input gets stored in the appropriate state variable thanks for 2 way binding
 What happens when you press the "Submit" button?
 - prints the state variables name and favoritecolor
 Can you add another field for entering an age?
 - age: Int added, used NumberFormatter() for conversion
 
  ************************************************* */

struct FormExample: View {
    
    @State private var name: String = ""
    @State private var favoriteColor: String = ""
    @State private var age: Int = 0
    
    var body: some View {
        Form {
            Section(header: Text("Your Info")) {
                TextField("Enter your name", text: $name)
                TextField("Favorite color", text: $favoriteColor)
                TextField("Age", value:$age, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .toolbar{
                        ToolbarItemGroup(placement: .keyboard){
                            Spacer()
                            Button("Done"){
                                hideKeyboard()
                            }
                        }
                    }
                    
            }
            
            Section {
                Button("Submit") {
                    print("Name: \(name), Favorite Color: \(favoriteColor), Age: \(age)")
                }
            }
        }
    }
}

// Helper function to hide the keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SimpleFormView_Previews: PreviewProvider {
    static var previews: some View {
        FormExample()
    }
}



 
 
