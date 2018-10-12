//
//  VoicesTableViewController.swift
//  TexToSpeech
//
//  Created by Ishan Sarangi on 10/11/18.
//  Copyright © 2018 Ishan Sarangi. All rights reserved.
//

import UIKit
import AVFoundation

protocol VoicesTableViewControllerDelegate: class {
    func didSelect(voice: AVSpeechSynthesisVoice)
}

class VoicesTableViewController: UITableViewController {

    let voices: [AVSpeechSynthesisVoice] = AVSpeechSynthesisVoice.speechVoices()
    weak var delegate: VoicesTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return voices.count
    }

    //MARK:- DataSource and Delegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voiceCell", for: indexPath)
        
        let voice: AVSpeechSynthesisVoice = voices[indexPath.row]
        cell.textLabel?.text = voice.name
        cell.detailTextLabel?.text = voice.language
        cell.detailTextLabel?.textColor = UIColor.red

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelect(voice: voices[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
