//
//  ProfileImageView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import SwiftUI

struct ProfileImageView: View {
    @Binding var avatarImage: UIImage
    @Binding var isDarkModeOn: Bool
    @Binding var isShowingImagePicker: Bool
    @Binding var isEditMode: Bool
    
    var body: some View {
        HStack {
            Spacer()
            if isEditMode {
                Button() {
                    isShowingImagePicker = true
                } label: {
                    ProfileImage(avatarImage: avatarImage, isDarkModeOn: isDarkModeOn)
                }
            } else {
                ProfileImage(avatarImage: avatarImage, isDarkModeOn: isDarkModeOn)
            }
            
            Spacer()
        }
    }
}

struct ProfileImage: View {
    let avatarImage: UIImage
    let isDarkModeOn: Bool
    
    var body: some View {
        Image(uiImage: avatarImage)
            .resizable()
            .scaledToFill()
            .padding(avatarImage == UIImage(systemName: "person.fill") ? 30 : 0)
            .frame(width: 120, height: 120)
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .foregroundColor(isDarkModeOn ? Color.white : Color.black)
            .clipShape(Circle())
            .clipped()
            .overlay(Circle().stroke(isDarkModeOn ? Color.white : Color.black, lineWidth: 4))
            .padding()
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        @State var avatarImage = UIImage(systemName: "person.fill")!
        @State var isDarkModeOn = false
        @State var isShowingImagePicker = false
        @State var isEditMode = true
        
        return ProfileImageView(avatarImage: $avatarImage, isDarkModeOn: $isDarkModeOn, isShowingImagePicker: $isShowingImagePicker, isEditMode: $isEditMode)
    }
}
