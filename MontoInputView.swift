import SwiftUI

struct MontoInputView: View {
    @State private var monto: String = ""
    @State private var categoria: String = "Educación"

    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background to detect taps outside the TextField
            Color(.systemBackground)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }

            VStack {
                TextField("Monto", text: $monto)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Picker("Categor\u00eda", selection: $categoria) {
                    Text("Educaci\u00f3n").tag("Educaci\u00f3n")
                    Text("Comida").tag("Comida")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
    }
}

#if canImport(UIKit)
extension View {
    /// Dismisses the keyboard by resigning the first responder.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct MontoInputView_Previews: PreviewProvider {
    static var previews: some View {
        MontoInputView()
    }
}
