//
//  SoundFile.swift
//  testQuizApp
//
//  Created by 原田和輝 on 2020/04/23.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String){
        
//        再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do{
            
//            効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        }catch{
            
            print("エラーです！")
            
        }
        
    }
    
}
