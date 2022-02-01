//
//  ProfileImageView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 01.02.2022.
//

import SwiftUI

struct ProfileImageView: View {
  @Binding var avatarImage: UIImage
  @Binding var showingImagePicker: Bool
  @Binding var isDarkModeOn: Bool
  
  var body: some View {
    HStack {
      Spacer()
      
      Button() {
        showingImagePicker = true
      } label: {
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
      
      Spacer()
    }
  }
}

struct ProfileImageView_Previews: PreviewProvider {
  static var previews: some View {
    @State var avatarImage = UIImage(systemName: "person.fill")!
    @State var showingImagePicker = false
    @State var isDarkModeOn = false
    
    return ProfileImageView(avatarImage: $avatarImage, showingImagePicker: $showingImagePicker, isDarkModeOn: $isDarkModeOn)
  }
}
