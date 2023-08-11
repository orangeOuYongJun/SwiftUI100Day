//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Yongjun Ou on 8/9/23.
//

import Foundation
import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provide = results.first?.itemProvider else {
                return
            }
         
            if provide.canLoadObject(ofClass: UIImage.self) {
                provide.loadObject(ofClass: UIImage.self) { img, _ in
                    self.parent.image = img as? UIImage
                }
            }
        }
    }
    
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    
//    typealias UIViewControllerType = PHPickerViewController
}
