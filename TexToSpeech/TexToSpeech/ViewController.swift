//
//  ViewController.swift
//  TexToSpeech
//
//  Created by Ishan Sarangi on 10/11/18.
//  Copyright © 2018 Ishan Sarangi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var speechVoice: AVSpeechSynthesisVoice = AVSpeechSynthesisVoice()
    
    @IBOutlet weak var speechVoiceLabel: UILabel!
    @IBOutlet weak var textToSpeechTextView: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }

    func setupView(){
        speechVoiceLabel.text = "Default Voice"

        textToSpeechTextView.layer.cornerRadius = 5
        textToSpeechTextView.layer.borderColor = UIColor.black.cgColor
        textToSpeechTextView.layer.borderWidth = 1
        textToSpeechTextView.becomeFirstResponder()
    }
    @IBAction func speakButtonPressed(_ sender: Any) {
        if let text = textToSpeechTextView.text{
            let synthesizer = AVSpeechSynthesizer()
            let speech = AVSpeechUtterance(string: text)
                speech.voice = speechVoice
            
            synthesizer.speak(speech)
        }
    }
    
    @IBAction func voicesButtonPressed(_ sender: Any) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VoicesTableViewController") as? VoicesTableViewController{
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
}

extension ViewController: VoicesTableViewControllerDelegate{
    func didSelect(voice: AVSpeechSynthesisVoice) {
        speechVoiceLabel.text = voice.name
    }
    
    
}


