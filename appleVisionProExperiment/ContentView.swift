//
//  ContentView.swift
//  appleVisionProExperiment
//
//  Created by Lluís Agustí on 26/2/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var imageUrl: URL?
    
    var body: some View {
        VStack {
            if let imageUrl = imageUrl {
                AsyncImage(url: imageUrl)
                    .frame(width: 300, height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding()
            }
            
            Button("Fetch Random Image") {
                fetchRandomImage()
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    
    func fetchRandomImage() {
        let apiKey = "API_HERE"
        let url = URL(string: "https://api.giphy.com/v1/gifs/random?api_key=\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: url) { data,
            response, error in
            if let data = data {
                if let response = try?
                    JSONDecoder().decode(RandomResponse.self,
                                         from: data) {
                    DispatchQueue.main.async {
                        self.imageUrl = URL(string: response.data.images.fixed_height.url)
                    }
                }
            }
        }
        task.resume()
    }
}

struct RandomResponse: Codable {
    let data: Gif
}

struct Gif: Codable {
    let images: GifImages
}

struct GifImages: Codable {
    let fixed_height: imageUrl
}

struct imageUrl: Codable {
    let url: String
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
