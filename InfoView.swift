import SwiftUI
struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 147 / 255, green: 159 / 255, blue: 167 / 255)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color(red: 147 / 255, green: 159 / 255, blue: 167 / 255))
                VStack {
                    Spacer()
                    Text("Relay for Life")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255))
                    
                    Text("Organization: American Cancer Society")
                    Text("Location: Multiple (Worldwide)")
                    Text("Date: Year-round")
                        .padding(.horizontal, 25)
                    
                    Image("relay") // Replace with your image
                        .resizable()
                        .frame(width: 340, height: 200)
                        .padding()
                        
                    Text("More than just a fundraising walk, the American Cancer Society Relay For Life brings together passionate supporters who embody the American Cancer Society vision to end cancer as we know it, for everyone. This volunteer-led experience unites communities to celebrate cancer survivors, remember loved ones lost to cancer, and raise funds to improve the lives of people with cancer and their families through advocacy, research, and patient support to ensure everyone has an opportunity to prevent, detect, treat, and survive cancer.")
                        .padding(.horizontal, 25)
                    
                    Spacer()
                    HStack(spacing: 20) {
                        Link(destination: URL(string: "https://secure.acsevents.org/site/SPageServer/?pagename=relay&_gl=1*i6urpc*_ga*MTU3NjE0NjkyMy4xNjk4MzQ3ODgy*_ga_12CJLLFFQT*MTY5ODM0Nzg4Mi4xLjAuMTY5ODM0Nzg4My4wLjAuMA..&_ga=2.40760674.1754264912.1698347883-1576146923.1698347882")!) {
                            Text("Learn More")
                                .font(.headline)
                                .padding()
                                .background(Color(red: 198 / 255, green: 209 / 255, blue: 208 / 255))
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Close")
                                .font(.headline)
                                .fontWeight(.regular)
                                .padding()
                                .background(Color(red: 147 / 255, green: 159 / 255, blue: 167 / 255))
                                .foregroundColor(Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255))
                                .cornerRadius(10)
                        }
                    }
                    Spacer()
                }
            }
            }
        }
    }
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
