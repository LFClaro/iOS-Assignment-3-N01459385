//
//  ViewController.swift
//  Assignment3-N01459385
//
//  Created by Luiz Fernando Reis on 2021-11-13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddingPhotoDelegateProtocol {
    @IBOutlet weak var photoPicker: UIPickerView!
    @IBOutlet weak var photoDisplay: UIImageView!
    
    var manager : PhotoManager = PhotoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func controllerDidFinishWithNewPhoto(p: PhotoInfo) {
        manager.addNewPhoto(newPhoto: p)
        photoPicker.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllPhotos().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllPhotos()[row].title 
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            DispatchQueue.main.async {
                if let data = try? Data(contentsOf: self.manager.getAllPhotos()[row].url) {
                    if let photo = UIImage(data: data){
                        self.photoDisplay.image = photo
                    } else {
                        self.imageError()
                    }
                } else {
                    self.imageError()
                }
            }
        }
    }
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    func imageError(){
        let alert = UIAlertController(title: "Error!", message: "This is not a valid image.", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let aVC = segue.destination as! addPhotoViewController
        aVC.delegate = self
    }
}

