//
//  ApplicationBackgroundColor.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

struct ApplicationBackgroundColor: View {
    var body: some View {
      Color.green
        .opacity(0.1)
        .ignoresSafeArea()
    }
}

struct ApplicationBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationBackgroundColor()
    }
}
