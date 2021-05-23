//
//  ContentView.swift
//  ImageCropper
//
//  Created by APPLE on 2021/05/23.
//

import SwiftUI

struct ContentView: View {
    var originalImage = UIImage(named: "food")
    
    @State var croppedImage: UIImage?
    @State var cropperShown = false
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Original")
            Image(uiImage: originalImage!)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Spacer()
            
            if croppedImage != nil {
                Text("Cropped")
                Image(uiImage: croppedImage!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
            }
            
            Button(action: {
                cropperShown = true
            }, label: {
                Text("크로핑하러가기")
            })
            
            Spacer()
        }
        .sheet(isPresented: $cropperShown) {
            ImageCroppingView(shown: $cropperShown, image: originalImage!, croppedImage: $croppedImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
