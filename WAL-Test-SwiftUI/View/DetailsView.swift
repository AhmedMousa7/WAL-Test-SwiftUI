//
//  DetailsView.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.
//

import SwiftUI

struct DetailsView: View {
    var user: User?
    
    var body: some View {
        VStack {
            RemoteImage(withURL: user?.avatar_url)
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .padding()
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.gray)
                .frame(height: 50)
                .padding()
                .overlay(
                    HStack{
                        Text("Name:")
                        Text(user?.login ?? "")
                    }
                )
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.gray)
                .frame(height: 50)
                .padding()
                .overlay(
                    HStack{
                        Text("Profile:")
                        Text(user?.html_url ?? "")
                            .foregroundColor(.blue)
                    }
                )
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
