//
//  Model.swift
//  Project_RxSwift
//
//  Created by iOS Development on 7/11/18.
//  Copyright © 2018 Genisys. All rights reserved.
//

import Foundation
import RxSwift

struct Model {
    let titleLabel: String
    let detailLabel:String
   
    static var array : [Model] = {
        let sawan = Model(titleLabel: "Sawan Kumar", detailLabel: "+91-8010153210")
        let arjun = Model(titleLabel: "Arjun Singh", detailLabel: "+91-8010153211")
        let shyam = Model(titleLabel: "Shayam Yadav", detailLabel: "+91-8010153212")
        let aman = Model(titleLabel: "Aman Kon", detailLabel: "+91-8010153213")
        let Kala = Model(titleLabel: "Kala Jo", detailLabel: "+91-8010153210")
        return [sawan, arjun, shyam, aman, Kala]
    }()
    
    
}
