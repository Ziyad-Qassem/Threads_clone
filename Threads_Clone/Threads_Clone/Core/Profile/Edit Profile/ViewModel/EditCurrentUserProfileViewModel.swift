//
//  EditCurrentUserProfileViewModel.swift
//  Threads_Clone
//
//  Created by Ziyad Qassem on 17/12/2024.
//

import Foundation
import SwiftUI
import PhotosUI
import FirebaseAuth
import FirebaseFirestore
class EditCurrentUserProfileViewModel : ObservableObject {
    @Published var selectedItem :PhotosPickerItem? {
        didSet{Task {await loadImage()}}
    }
    
    private var uiImage : UIImage?
    @Published var profileImage : Image?
    
    
    func uploadUserData() async throws {
        try await updateProfileImage()
       
    }
    
    @MainActor
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        
        guard let image = UIImage(data: data) else {return}
        self.uiImage = image
        self.profileImage = Image(uiImage: image)
    }
    
    private func updateProfileImage()  async throws{
        guard let image = self.uiImage else {return}
        
        guard let imageURL = try? await ImageUploader.uploadUserProfileImage(image) else {return}
        try await UserService.shared.updateUserProfileImage(withImageURL: imageURL)
        
    }
}
