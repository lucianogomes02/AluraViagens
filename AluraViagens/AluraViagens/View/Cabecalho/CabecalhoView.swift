//
//  CabecalhoView.swift
//  AluraViagens
//
//  Created by Luciano Gomes on 08/08/23.
//

import UIKit

class CabecalhoView: UIView {

    @IBOutlet weak var titulo: UILabel!
    
    @IBOutlet weak var cabecalho: UIView!
    
    @IBOutlet weak var banner: UIView!
    
    @IBOutlet weak var imagem: UIImageView!
    
    func configurarView() {
        cabecalho.backgroundColor = UIColor(red: 30.0/255, green: 59.0/255, blue: 119.0/255, alpha: 1)
        
        banner.layer.cornerRadius = 12.0
        banner.layer.masksToBounds = true
        
        cabecalho.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 150
        cabecalho.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
}
