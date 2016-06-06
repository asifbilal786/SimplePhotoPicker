//
//  PhotoPicker.swift
//  
//
//  Created by Asif Bilal on 23/05/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit

class PhotoPicker: NSObject {
    
    enum PickerSourceType: Int {
        case Camera = 0,
        PhotoLibrary,
        CameraAndPhotoLibrary
    }
    

    var successBlock:((originalPhoto:UIImage?, editedPhoto: UIImage?) -> ())!
    
    func pick(allowsEditing:Bool = false,
              pickerSourceType: PickerSourceType = .PhotoLibrary,
              controller: UIViewController,
              successBlock success: ((originalPhoto:UIImage?, editedPhoto: UIImage?) -> ()))
    {
        
        if pickerSourceType == .CameraAndPhotoLibrary {
            
           let alertController = UIAlertController(title: "Select", message: "Source Type", preferredStyle: .ActionSheet)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
                print("User pressed Cancel")
            }))
            
            alertController.addAction(UIAlertAction(title: "Take photo", style: .Default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .Camera, controller: controller, successBlock: success)
            }))
            
            alertController.addAction(UIAlertAction(title: "Choose photo", style: .Default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .PhotoLibrary, controller: controller, successBlock: success)
            }))
            
            controller.presentViewController(alertController, animated: true, completion: nil)
            
            return
            
        }
        
        //Now show the Image Picker Controller
        
        var sourceType:UIImagePickerControllerSourceType!
        
        switch pickerSourceType {
        case .Camera:
            
            if UIImagePickerController.isSourceTypeAvailable(.Camera) {
                sourceType = .Camera
            } else {
                sourceType = .SavedPhotosAlbum
            }
            
        case .PhotoLibrary:
            sourceType = .PhotoLibrary
        default:
            sourceType = .SavedPhotosAlbum
            
        }
        
        let picker = UIImagePickerController()
        
        picker.sourceType = sourceType
        picker.allowsEditing = allowsEditing
        picker.delegate = self
        
        self.successBlock = success
        
        controller.presentViewController(picker, animated: true, completion: nil)
        
    }
    
}

extension PhotoPicker: UINavigationControllerDelegate {

}

extension PhotoPicker: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let originalPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
        let editedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        
        successBlock(originalPhoto: originalPhoto, editedPhoto: editedPhoto)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
