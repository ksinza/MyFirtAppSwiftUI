//
//  SUImagePickerView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    
    init(image: Binding<Image?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        //Modificar nombre constante
        //Modificar nombre constante
        
        if let UiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            self.image = Image(uiImage: UiImage)
            
            if let data = UiImage.pngData(){
                
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                
                let url = documents.appendingPathComponent("fotoperfil.png")
                
                do{
                    
                    try data.write(to: url)
                    
                    
                }catch{
                    
                    print("No pude guardar fotografia en el folder del dispositivo (\(error))")
                    
                }
                
                
                
            }

            
            
        }
        
        
        self.isPresented = false
      /*  if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: image)
        }
        self.isPresented = false*/
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
}

