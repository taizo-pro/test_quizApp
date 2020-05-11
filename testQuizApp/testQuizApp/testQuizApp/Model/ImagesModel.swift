
//
//  ImagesModel.swift
//  testQuizApp
//
//  Created by 原田和輝 on 2020/04/21.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import Foundation

class ImagesModel {
    
//    どういう機能を作るか
    
//    画像名を取得して、その画像が人間かそうでないかをフラグによって判定するための機能
    
    let imageText:String
    let answer:Bool
    
//    クラスを初期化して、実体化する
    init(imageName:String,correctOrNot:Bool) {
        
        imageText = imageName
        answer = correctOrNot
        
        
    }
    
    
}
