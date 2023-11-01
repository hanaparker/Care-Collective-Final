//
//  ContentView.swift
//  HP_accountPage
//
//  Created by Hana Parker on 8/1/23.
//
import SwiftUI
import MapKit
import PhotosUI
import WebKit
final class LikedState: ObservableObject {
    @Published var isLiked = false
}
struct YourApp: App {
    let likedState = LikedState() // Create an instance of LikedState
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(likedState) // Pass it to the environment
        }
    }
}
struct HomeView: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
                    Header()
                    ScrollView(.vertical, showsIndicators: false) {
                        stories()
                        Spacer()
                        post()
                        Spacer()
                        Spacer()
                        Divider()
                        Spacer()
                        Spacer()
                        post(image: "post2", description: "Huge shout out to William Floyd High School for their efforts in raising $2,500 for breast cancer research! Find out how you can change the world too through the info button!")
                    }
                }
                .background(Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255))
            }
        }
        
        struct postContent: View {
            @EnvironmentObject var likedState: LikedState
            //@State private var isLiked = false // Add a state variable to track whether the heart button is liked
            @State private var isBookmarked = false // Add a state variable to track whether the bookmark button is bookmarked
            @State private var showInfoSheet = false // Add a state variable to control the info sheet
            var image: String = "post1"
            var body: some View {
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: .infinity)
                        .aspectRatio(contentMode: .fit)
                    HStack {
                        Button(action: {
                            likedState.isLiked.toggle()
                            //vm.isLiked = false
                            
                           
                            
                            //vm.isLiked = true
                        }) {
                            Image(systemName: likedState.isLiked ? "heart.fill" : "heart")
                        }
                        .foregroundColor(likedState.isLiked ? .red : .black)
                  
                        
                        
                        
                        
                        Image(systemName: "bubble.left")
                        Image(systemName: "paperplane")
                        Spacer()
                        Button(action: {
                            isBookmarked.toggle()
                        }) {
                            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        }
                        .foregroundColor(isBookmarked ? .black : .black)
                        
                        Button(action: {
                                            showInfoSheet.toggle() // Toggle the info sheet
                                        }) {
                                            Image(systemName: "info.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color(red: 147 / 255, green: 159 / 255, blue: 167 / 255))
                                        }
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 2)
                                    .padding(.top, -5)
                                }
                .padding(.horizontal, 0)
                                .sheet(isPresented: $showInfoSheet) {
                                    InfoView()
                                }
                            }
                        }
        struct post: View {
            var image: String = "post1"
            var description: String = "It's almost time for our worldwide annual Relay For Life event... consider participating in a race or even starting one in your own community!"
            var body: some View {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                            .frame(width:270, height:60)
                            .offset(y:15)
                        postHeader()
                    }
                    postContent(image: image)
                    Text("Liked by hanaparker, siri.m, and others")
                        .font(.footnote)
                        .frame(width: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                        .foregroundColor(Color(red: 184 / 255, green: 184 / 255, blue: 184 / 255))
                    Text(description)
                        .font(.footnote)
                        .frame(width: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                    HStack {
                        HStack(spacing: 10) {
                            Image("profile1")
                                .resizable()
                                .frame(width: 30, height: 35)
                                .cornerRadius(5)
                                .aspectRatio(contentMode: .fill)
                                .offset(x: 20, y: 5)
                            HStack {
                                Text("Add Comment...")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                                    .offset(x: 20, y: 4)
                                Text("👍")
                                    .offset(x: 130, y: 2)
                                Text("👏")
                                    .offset(x: 130, y: 2)
                                Text("😍")
                                    .offset(x: 130, y: 2)
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color(red: 96 / 255, green: 96 / 255, blue: 96 / 255))
                                    .offset(x: 130, y: 2)
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
        struct postHeader: View {
            var body: some View {
                HStack {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 55, height: 55)
                                .foregroundColor(Color(red: 198/255, green: 209/255, blue: 208/255))
                            Image("profile2")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .cornerRadius(50)
                        }
                        Text("@americancancersociety")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .offset(y: 10)
                    }
                    Spacer()
                    Image("")
                }
                .padding(.horizontal, 10)
            }
        }
        struct stories: View {
                var body: some View {
                    ZStack {
                        Color(red: 184 / 255, green: 184 / 255, blue: 184 / 255)
                            .frame(height: 160)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                Story(image: "profile1", name: "Your Story")
                                Story(image: "profile7", name: "uncblueridge")
                                Story(image: "profile8", name: "carolinaeast")
                                Story(image: "profile3", name: "hanaparker")
                                Story(image: "profile2", name: "americanca...")
                                Story(image: "profile4", name: "siri.m")
                                Story(image: "profile5", name: "atriumhealth")
                                Story(image: "profile10", name: "novanthealth")
                                Story(image: "profile6", name: "internetedu...")
                                Story(image: "profile9", name: "wakemed")
                                
                               
                            }
                            .padding(.horizontal, 10)
                        }
                        .padding(.vertical, 20)
                    }
                }
            }
        struct Story: View {
            var image: String = "profile"
            var name: String = "name"
            var body: some View {
                    VStack {
                        VStack {
                            Image(image)
                                .resizable()
                                .frame(width: 75, height: 90)
                                .cornerRadius(10)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(LinearGradient(colors: [Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255), Color(red: 198 / 255, green: 209 / 255, blue: 208 / 255), Color(red: 96 / 255, green: 96 / 255, blue: 96 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                                .frame(width: 80, height: 95) // Adjust the size of the rectangle
                        )
                                .frame(width: 85, height: 100) // Adjust the overall frame size
                        Text(name)
                            .font(.caption)
                    }
                }
            }
        struct Header: View {
            var body: some View {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Text("Explore Opportunities")
                        .bold()
                        .font(.system(size: 23))
                        .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                    HStack(alignment: .center, spacing: 10) {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                        Image(systemName: "message")
                            .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                        Image(systemName: "bookmark")
                            .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                    }
                    Spacer()
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
    }
}
        
    
struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    var body: some View {
        NavigationView {
                        ZStack {
                            
                            Color(red: 232/255, green: 233/255, blue: 233/255)
                                .ignoresSafeArea()
                            VStack(alignment: .leading, spacing: 20.0) {
                                HStack {
                                            Image("logo")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            Spacer()
                                            Text("Opportunity Map and List")
                                                .bold()
                                                .font(.system(size: 23))
                                                .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255)) // Example custom color
                                            HStack(alignment: .center, spacing: 10) {
                                                Spacer()
                                                
                                            }
                                            Spacer()
                                        }
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 12)
                                        .background(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                                       .fill(Color(red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                                                       .frame(width:150, height:60)
                                                       .padding(.leading)
                                    Text("Map 🗺️")
                                        .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                }
                                
                                ZStack {
                                    VStack {
                                        ZStack {
                                            Map(coordinateRegion: $mapRegion)
                                                
                                            }
                                        }
                                        .padding()
                                        .background(Color(red: 96/255, green: 96/255, blue: 96/255))
                                        .cornerRadius(15)
                                        .padding()
                                        .font(.footnote)
                                        
                                    }
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                                       .fill(Color(red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                                                       .frame(width:150, height:60)
                                                       .padding(.leading)
                                    Text("List 🗂️")
                                        .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                }
                                
                              
                                    ScrollView(.vertical){
                                        VStack(spacing: 25){
                                            
                                            Menu("> Red Cross Volunteering") {
                                                Button("Visit Website") {
                                                    if let url = URL(string: "https://www.redcross.org/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                    
                                                }
                                                Button("Become a Volunteer") {
                                                    if let url = URL(string: "https://www.redcross.org/volunteer/volunteer-role-finder.html") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                
                                            }
                                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255))
                                            .padding(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Menu("> Medical Justice Alliance") {
                                                Button("Visit Website") {
                                                    if let url = URL(string: "https://medicaljusticealliance.org/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                Button("Apply to Volunteer") {
                                                    if let url = URL(string: "https://airtable.com/shrJ5dGqTBw1S7Mnn") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                
                                            }
                                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255))
                                            .padding(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Menu("> Baylor Scott and White") {
                                                Button("Visit Website") {
                                                    if let url = URL(string: "https://www.bswhealth.com/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                Button("Apply to Volunteer") {
                                                    if let url = URL(string: "https://www.bswhealth.com/get-involved/become-a-volunteer") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                
                                            }
                                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255))
                                            .padding(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            
                                            Menu("> Lifelong Medical Care") {
                                                Button("Visit Website") {
                                                    if let url = URL(string: "http://lifelongmedicalcare.org/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                Button("Apply to Volunteer") {
                                                    if let url = URL(string: "https://lifelongmedical.org/volunteer/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                
                                            }
                                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255))
                                            .padding(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Menu("> American Cancer Society") {
                                                Button("Visit Website") {
                                                    if let url = URL(string: "https://www.cancer.org/") {
                                                        UIApplication.shared.open(url)
                                                    }
                                            
                                                }
                                                Button("Apply to Volunteer") {
                                                    if let url = URL(string: "https://www.cancer.org/about-us/what-we-do/multicultural/hea.html") {
                                                        UIApplication.shared.open(url)
                                                    }
                                                }
                                                
                                            }
                                            .foregroundColor(Color(red: 96/255, green: 96/255, blue: 96/255))
                                            .padding(.leading)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            
                                        }
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
            
    }
var namesy = "Gigi Hadid"
var newName = " "
struct circleView : View {
    @State var namey = ""
    @State var no = ""
    @State var label: String
    @State private var presentPopup = false
    var body : some View{
        ZStack{
            Rectangle()
                .fill(Color("sage"))
                .frame(width: 80, height: 40)
            
            if(label == "Camera Roll"){
                NavigationLink(destination: myImpact()){
                    Text("\(label)")
                }
                .font(.footnote)
                .foregroundColor(Color("darkGrey"))
            } else if (label == "Favorites"){
                NavigationLink(destination: Favorites()){
                    Text("\(label)")
                }
                .font(.footnote)
                .foregroundColor(Color("darkGrey"))
                
            } else if (label == "My Posts"){
                NavigationLink(destination: myPosts()){
                    Text("\(label)")
                }
                .font(.footnote)
                .foregroundColor(Color("darkGrey"))
                
            } else if (label == "Settings"){
                NavigationLink(destination: Settings()){
                    Text("\(label)")
                }
                .font(.footnote)
                .foregroundColor(Color("darkGrey"))
                
            } /*else if (label == "Edit Name"){
                Button("Edit Name") {
                  presentPopup = true
                }
                .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                    Text("meow")
                    Text("\(no)")
                    
                    TextField("Type Name Here", text: $namey) //bind the property
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Button("Change"){
                        no = "\(namey)"
                    }
                    
                    
                        .font(.footnote)
                        .foregroundColor(Color("darkGrey"))
                }
            } else if (label == "Edit Picture"){
                Button("Edit Picture") {
                  presentPopup = true
                }
                .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                  Text("test")
                    .frame(width: 100, height: 100)
                }
                .font(.footnote)
                .foregroundColor(Color("darkGrey"))
                
            }
                
            */
            
        }
    }
}
struct AccountPage: View {
    @State private var org = ""
    @State private var hour = ""
    @State private var date = ""
    
    @State private var org1 = " "
    @State private var hour1 = " "
    @State private var date1 = " "
    
    @State private var name = "your name"
    @State private var name2 = ""
    @State private var bio = "your bio"
    @State private var bio2 = ""
    
    @State private var picture = "greenSquare"
    @State private var picture2 = ""
    
    @State private var presentPopup = false
    @State private var presentPopup2 = false
    
    @EnvironmentObject var likedState: LikedState
    @Environment(\.presentationMode) var presentationMode
    
    /*
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
*/
        //@State private var birthDate = Date.now
        @State private var showhoursLog = false
    @State private var showEditProfile = false
    
    final class PhotoPickerViewModel: ObservableObject {
        
        @Published private(set) var selectedImage: UIImage? = nil
        @Published var imageSelection: PhotosPickerItem? = nil{
            didSet {
                setImage(from: imageSelection)
            }
        }
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { return }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    
                    return
                }
            }
        }
    }
    }
    
   
    
    
    
    var user: ProfileInfo
    
        @State public var selectedSkinType = ""
        @State private var isShowingSkinTypeOptions = false
        let skinTypeOptions = ["your posts"]
        
        @State public var selectedSkinColor = ""
        @State private var isShowingSkinColorOptions = false
        let skinColorOptions = ["liked posts"]
        
        @State  var selectedSkinConcerns = Set<String>()
        @State private var isShowingSkinConcernOptions = false
        @State private var showInfoSheet = false
    @State private var showPhotoPicker = false
    
    @StateObject private var viewModel = PhotoPickerViewModel()
    
    var body: some View {
        ZStack{
            Color(red: 232 / 255, green: 233 / 255, blue: 233 / 255)
                .ignoresSafeArea()
            
            VStack() {
                Text("Your Profile")
                    .navigationTitle("User")
                    .font(.title)
                
                VStack(spacing: 40) {
                    if let image = viewModel.selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipShape(Circle())
                    } else {
                        // Display a default image (e.g., "person.circle")
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipShape(Circle())
                    }
                    
                    
                    
                }
                
                
                
            
            
            Text("\(name)")
                .font(.title)
            
            Text("\(bio)")
                .font(.title3)
                
                PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
                Text("change your photo")
                        }
            
            Button("Edit Profile") {
                
                presentPopup = true
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .foregroundColor(.black)
            .overlay{
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 1)
            }
            .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                ZStack{
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
                        
                        
                        .frame(width: 100, height: 100)
                        
                        Text("Change bio here:")
                            .font(.largeTitle)
                        
                        TextField("Bio", text: $bio2) //bind the property
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button("change"){
                            bio = "\(bio2)"
                            
                        }
                        
                        
                        .frame(width: 100, height: 100)
                        
                        Button(action: {
                            presentPopup = false
                        }) {
                            Text("Done")
                                .font(.headline)
                                .fontWeight(.regular)
                                .padding()
                                .background(Color (red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                                .cornerRadius(10)
                            
                        }
                    }
                }
            }
            .padding()
            
            
            
            
            
            
            
            //edit profile button
            /*
             Button(action: {
             showEditProfile.toggle() // Toggle the info sheet
             },label: {
             Text("Edit Profile")
             .font(.subheadline)
             .fontWeight(.semibold)
             .frame(width: 360, height: 32)
             .foregroundColor(.black)
             .overlay{
             RoundedRectangle(cornerRadius: 6)
             .stroke(Color.gray, lineWidth: 1)
             }
             .sheet(isPresented: $showEditProfile) {
             EditProfile()
             }
             })
             */
            Button(action: {
                showhoursLog.toggle() // Toggle the info sheet
            }, label: {
                Text("Log Hours")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            })
            .sheet(isPresented: $showhoursLog) {
                hoursLog()
            }
            .padding()
            
            Divider()
            
            ScrollView{
                ZStack{
                    Color(red:198 / 255, green: 209 / 255, blue: 208 / 255)
                    VStack(alignment:.leading){
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 139 / 255, green: 153 / 255, blue: 131 / 255))
                                .frame(width:150, height:40)
                                .padding()
                            
                            HStack{
                                
                                Text("Liked Posts:")
                                Image(systemName: "heart.fill")
                            }
                            .foregroundColor(Color(red: 232/255, green: 233/255, blue: 233/255))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                            
                        }
                        
                        
                        Spacer()
                        ScrollView(.vertical){
                            Color (red: 198 / 255, green: 209 / 255, blue: 208 / 255)
                            
                            if(likedState.isLiked){
                                //Text("isLiked: \(vmm.isLiked ? "true" : "false")")
                                
                                Button(action: {
                                    showInfoSheet.toggle() // Toggle the info sheet
                                }) {
                                    Image("post1")
                                        .resizable()
                                        .frame(width: .infinity)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .padding(.top, -5)
                                .padding(.horizontal, 0)
                                .sheet(isPresented: $showInfoSheet) {
                                    InfoView()
                                }
                                
                                Button(action: {
                                    showInfoSheet.toggle() // Toggle the info sheet
                                }) {
                                    Image("post2")
                                        .resizable()
                                        .frame(width: .infinity)
                                        .aspectRatio(contentMode: .fit)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .padding(.top, -5)
                                .padding(.horizontal, 0)
                                .sheet(isPresented: $showInfoSheet) {
                                    InfoView()
                                }
                            }
                        }
                    }
                    
                }
            }
            Divider()
        }
            }
        
        
        /*
        NavigationView {
            ZStack{
                Color.white
                
                VStack{
                    ZStack{
                        Color("lighGrey")
                            .background(Color("lightGrey").edgesIgnoringSafeArea(.top))
                        
                        VStack{
                            VStack (spacing: 5){
                                Image("\(picture)")
                                    .resizable(resizingMode:.stretch)
                                    .aspectRatio(contentMode:.fit)
                                    .cornerRadius(10)
                                    .frame(width:200, height: 300)
                                    .clipShape(Circle())
                                
                                Text("\(name)")
                                    .font(Font.custom("Optimaisplay-Book", size: 32, relativeTo: .title))
                                
                                   
                                
                            
                                VStack{
                                    
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 35){
                                            circleView(label: "Camera Roll")
                                            circleView(label: "Favorites")
                                            circleView(label: "My Posts")
                                            circleView(label: "Settings")
                                            
                                            Button("Edit Name") {
                                                presentPopup = true
                                            }
                                            .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                                                Text("Change name here:")
                                                    .font(.largeTitle)
                                                
                                                TextField("Name", text: $name2) //bind the property
                                                    .multilineTextAlignment(.center)
                                                    .padding()
                                                
                                                Button("change"){
                                                    name = "\(name2)"
                                                    
                                                }
                                                
                                                
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                            Button("Edit Picture") {
                                                presentPopup2 = true
                                            }
                                            .popover(isPresented: $presentPopup2, arrowEdge: .bottom) {
                                                
                                            
                                                Text("Change your picture here:")
                                                    .font(.largeTitle)
                                                
                                                TextField("Picture", text: $picture2) //bind the property
                                                    .multilineTextAlignment(.center)
                                                    .padding()
                                                
                                                Button("change"){
                                                    picture = "\(picture2)"
                                                    
                                                }
                                                
                                                Button("save"){
                                                    
                                                }
                                                
                                                
                                                    .frame(width: 100, height: 100)
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                        
                                        
                                    
                                        .padding()
                                    .frame(height: 100)
                                    
                                    HStack (spacing: 70){
                                        Text("Orgs")
                                            
                                        
                                        Text("Hours")
                                        
                                        Text("Dates")
                                        
                                        Text("     ")
                                    }
                                    
                                    HStack (spacing: 20){
                                        TextField("Org", text: $org) //bind the property
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                        
                                        TextField("Hour", text: $hour) //bind the property
                                            .multilineTextAlignment(.leading)
                                        
                                        TextField("Date", text: $date) //bind the property
                                            .multilineTextAlignment(.leading)
                                        
                                        
                                        
                                    }
                                    
                                    HStack(spacing:62){
                                        Button("add"){
                                            org1 = "\(org)"
                                            if(!org.isEmpty){
                                                org = ""
                                            }
                                            
                                        }
                                        .padding()
                                        
                                        Button("add"){
                                            hour1 = "\(hour)"
                                            if(!hour.isEmpty){
                                                hour = ""
                                            }
                                        }
                                        .padding()
                                        
                                        Button("add"){
                                            date1 = "\(date)"
                                            if(!date.isEmpty){
                                                date = ""
                                            }
                                            
                                
                                        }
                                        .padding()
                                        
                                        Text("    ")
                                    }
                                    
                                    HStack(spacing:70){
                                        Text(org1)
                                        Text(hour1)
                                        Text(date1)
                                        Text("    ")
                                    }
                                    
                                    
                                }
                                
                                Spacer()
                                
                                /*
                                HStack{
                                    Button("Settings"){
                                        
                                    }
                                }
                                 */
                                
                            }
                        }
                                
                    }
                }
                
                
                
                
                
                
                
                
                
                
            }
            
            
        }
         */
        
    }
}
struct ContentView: View {
    var body: some View {
        @EnvironmentObject var likedState: LikedState
        
        ContentView()
            .environmentObject(LikedState())
        
                TabView{
    
            HomeView()
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            MapView()
            .tabItem {
                Image(systemName: "location.circle")
                Text("Map")
            }
            
            AccountPage(user: ProfileInfo(name: "diff", skinType: "", skinColor:"", skinConditions: "", imageName: ""))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
    
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
                
                
                
                
                
    
       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        @EnvironmentObject var likedState: LikedState
        
        ContentView()
            .environmentObject(LikedState())
        AccountPage(user: ProfileInfo(name: "diff", skinType: "", skinColor:"", skinConditions: "", imageName: ""))
            .environmentObject(LikedState())
    }
}

