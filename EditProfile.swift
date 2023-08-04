import SwiftUI
struct EditProfile: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var birthDate = Date.now
    @State public var hoursOptions = ""
    @State private var hoursShown = false
    let hours = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
   
    @State private var selectedHour = 1
    @State private var selectedDate = Date()
    @State private var itemList: [String] = []
    
    @State private var name = "Type your name here"
    @State private var name2 = ""
    
    @State private var picture = "greenSquare"
    @State private var picture2 = ""
    
    @State private var presentPopup = false
    @State private var presentPopup2 = false
    
    
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255)
                    .ignoresSafeArea()
                    
                VStack{
                        Text("Change name here:")
                            .font(.largeTitle)
                        
                        TextField("Name", text: $name2) //bind the property
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button("change"){
                            name = "\(name2)"
                            
                        }
                    
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Close")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding()
                            .background(Color (red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                            .cornerRadius(10)
                    
                    }
                }
                .padding()
                }
                    
                
                    
                }
        }
    }
struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
