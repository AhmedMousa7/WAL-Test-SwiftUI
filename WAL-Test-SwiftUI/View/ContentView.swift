//
//  ContentView.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dataManager = DataManager()
    
    var body: some View {
        NavigationView {
            List(dataManager.users) { user in
                NavigationLink(
                    destination: DetailsView(user: user),
                    label: {
                        HStack {
                            RemoteImage(withURL: user.avatar_url)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                            
                            Text(user.login)
                        }
                    })
            }
            .navigationTitle("WAL-Test")
        }.onAppear(perform: {
            dataManager.fetchGithubUsers()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
