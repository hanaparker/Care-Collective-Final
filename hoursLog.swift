import SwiftUI
struct hoursLog: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var birthDate = Date.now
    @State public var hoursOptions = ""
    @State public var loc = ""
    @State private var hoursShown = false
    let hours = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"]
   
    @State private var selectedHour = 1
    @State private var selectedDate = Date()
    @State private var itemList: [String] = [] 
    
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
                    
                VStack {
                    DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Select a date")
                    }
                    
                    Section{
                        Picker("Select number of hours", selection: $hoursOptions) {
                            ForEach(hours, id: \.self){
                                Text($0)
                            }
                            .foregroundColor(.black)
                        }
                    }
                    
                    TextField("Location", text: $loc) //bind the property
                        .multilineTextAlignment(.center)
                        .padding()

                    
                    Text("\(hoursOptions) hours on \(birthDate, formatter: dateFormatter)")
                    
                    
                    .pickerStyle(.automatic)
                    
                    
                    HStack (spacing: 20){
                        /*
                        TextField("Hours", text: $hoursOptions) //bind the property
                            .multilineTextAlignment(.leading)
                            .padding()
                    
                    */
                    HStack(spacing:62){
                        Button("Add Item") {
                            let formattedDate = dateFormatter.string(from: birthDate)
                            let newItem = "Hours: \(hoursOptions), Date: \(formattedDate) Location: \(loc)"
                                       itemList.append(newItem)
                                   }
                        
                                   List(itemList, id: \.self) { item in
                                       Text(item)
                                           .foregroundColor(.black)
                                   }
                        
                        
                        }
                        .font(.headline)
                        .fontWeight(.regular)
                        .padding()
                        .background(Color(red: 147 / 255, green: 159 / 255, blue: 167 / 255))
                        .foregroundColor(Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255))
                        .cornerRadius(10)
                    }
                    
                    .padding()
                    
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
struct hoursLog_Previews: PreviewProvider {
    static var previews: some View {
        hoursLog()
    }
}
