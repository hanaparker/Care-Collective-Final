import SwiftUI
import PhotosUI

@MainActor
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
            /*do {
                let data = try await selection.loadTransferable(type: Data.self)
                
                guard let data, let uiImage = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                
                selectedImage = uiImage
            } catch {
                print(error)
            }
        }
    }
    
    private func setImages(from selection: PhotosPickerItem?) {
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
*/

struct PhotoPicker: View {
    @StateObject private var viewModel = PhotoPickerViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            
            
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
            }
            
            PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
                Text("Select a profile picture")
                    .foregroundColor(.red)
            }
        }
    }
}

struct PhotoPicker_Previews : PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
