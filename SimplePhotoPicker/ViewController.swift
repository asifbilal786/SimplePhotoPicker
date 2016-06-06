//
//  ViewController.swift
//  SimplePhotoPicker
//
//  Created by Asif Bilal on 03/06/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    private lazy var photoPicker = PhotoPicker()
    
    private var pickerSourceType: PhotoPicker.PickerSourceType = .Camera
    private var allowsEditing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickPhotoTouchUpInside(sender: AnyObject) {
        showPickerWithOptions()
    }
    
    @IBAction func valueChanged(sender: UISegmentedControl) {
        
        // Convert selected segment index into picker source type
        if let sourceType = PhotoPicker.PickerSourceType(rawValue: sender.selectedSegmentIndex) {
            pickerSourceType = sourceType
        }
    }
    
    @IBAction func allowsEditingChanged(sender: UISwitch) {
        allowsEditing = sender.on
    }
    
    private func showPickerWithOptions() {
        
        photoPicker.pick(allowsEditing, pickerSourceType: pickerSourceType, controller: self) { (originalPhoto, editedPhoto) in
            if self.allowsEditing { self.imageView.image = editedPhoto}
            else { self.imageView.image = originalPhoto}
        }
    }
    
}