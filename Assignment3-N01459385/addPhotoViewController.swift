//
//  addPhotoViewController.swift
//  Assignment3-N01459385
//
//  Created by Luiz Fernando Reis on 2021-11-13.
//

import UIKit

protocol AddingPhotoDelegateProtocol {
    func controllerDidFinishWithNewPhoto(p: PhotoInfo)
    func controllerDidCancel()
}

class addPhotoViewController: UIViewController {
    var delegate : AddingPhotoDelegateProtocol?
    
    @IBOutlet weak var photoTitle: UITextField!
    @IBOutlet weak var photoUrl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addClicked(_ sender: Any) {
        if let title = photoTitle.text {
            if let url = URL(string: photoUrl.text!) {
                if !title.isEmpty && !url.absoluteString.isEmpty {
                    if (try? Data(contentsOf: url)) != nil {
                        let newPhoto = PhotoInfo(t: title, u: url)
                        delegate?.controllerDidFinishWithNewPhoto(p: newPhoto)
                        dismiss(animated: true, completion: nil)
                    } else {
                        validError()
                    }
                } else {
                    emptyError()
                }
            }
        }
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }

    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    func emptyError(){
        let alert = UIAlertController(title: "Error!", message: "Please fill both fields.", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func validError(){
        let alert = UIAlertController(title: "Error!", message: "URL must be a valid image.", preferredStyle: .alert)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

}
