//
//  RemoteImage.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.
//

import SwiftUI

struct RemoteImage: View {
    
    @ObservedObject private var loader: ImageLoader
    private var url: URL?
    
    init(withURL url: URL?) {
        self.loader = ImageLoader()
        self.url = url
    }
    
    var body: some View {
        
        Image(uiImage: loader.image ?? UIImage())
            .resizable()
            .onAppear {
                loader.load(url: self.url)
            }
    }
}
