//
//  NavigationHeaderView.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 09.02.2022.
//

import SwiftUI

struct NavigationHeaderView: View {
    var body: some View {
        RadialGradient(colors: [.green.opacity(0.3), .blue.opacity(0.5)], center: .bottomTrailing, startRadius: 0, endRadius: 300)
            .ignoresSafeArea()
            .frame(height: 0)
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeaderView()
    }
}
