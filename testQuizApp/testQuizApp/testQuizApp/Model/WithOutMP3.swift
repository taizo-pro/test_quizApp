//
//  WithOutMP3.swift
//  testQuizApp
//
//  Created by 原田和輝 on 2020/04/23.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import Foundation

class WithOutMP3:SoundFile{
    
    override func playSound(fileName: String, extensionName: String) {
        
        if extensionName == "mp3"{
            
            print("このファイルは再生できませんごめん")
            
        }
        player?.stop()
    }
    
}
