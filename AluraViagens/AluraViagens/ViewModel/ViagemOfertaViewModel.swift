//
//  ViagemOfertaViewModel.swift
//  AluraViagens
//
//  Created by Luciano Gomes on 14/08/23.
//

import Foundation

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
    
}
