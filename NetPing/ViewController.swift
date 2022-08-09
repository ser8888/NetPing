//
//  ViewController.swift
//  NetPing
//
//  Created by John Doe on 09/08/2022.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var textField: UITextField!
    
//        override func viewDidLoad() {
//        super.viewDidLoad()
//            let textEntered = "Taylor+Swift"
//            let urlString = "https://itunes.apple.com/search?term=\(textEntered)&limit=5"
//        fetchRequest(urlString: urlString)
//    }
    
    
    @IBAction func sendRequstPressed() {
 //       print(textField.text ?? "")
        let urlString = "https://itunes.apple.com/search?term=\(textField.text ?? "")&limit=5"
    fetchRequest(urlString: urlString)
    }
    
    
 //   @IBAction func doneButtonPressed() {
  //      print(textField.text ?? "")
//        let urlString = "https://itunes.apple.com/search?term=(textField.text)d&limit=5"
//                fetchRequest(urlString: urlString)
        
 //       let inputText = textField.text
        
 //       guard let inputText = textField.text, !inputText.isEmpty else {
//                showAlert(with: "Text field is empty", and: "Please enter your name")
//                return
//            }
//    }
}


private func fetchRequest(urlString: String) {
    
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url)  { data, _, error in
        
        guard let data = data else {
            print(error?.localizedDescription ?? "Unknown error")
            return
        }
        do {
            let tracks = try JSONDecoder().decode(Reply.self, from: data)
            tracks.results.map { track in
                print(track.trackName)
            }
        } catch let error {
            print("Failed to decode JSON", error)
            
        }
    }.resume()
}
