//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by Mark Amoah on 4/27/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.url(forResource: sound, withExtension: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer?.play()
            
        }catch{
            print("Could not locate sound file")
        }
    }else{
        print("file name does not exist")
    }
}
