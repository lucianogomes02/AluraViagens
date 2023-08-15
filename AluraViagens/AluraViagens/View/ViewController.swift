//
//  ViewController.swift
//  AluraViagens
//
//  Created by Luciano Gomes on 08/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagens: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        
        view.backgroundColor = UIColor(red: 30.0/255, green: 59.0/255, blue: 119.0/255, alpha: 1)
    }
    
    func configuraTableView() {
        viagens.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagens.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagens.dataSource = self
        viagens.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            guard let viagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {fatalError("Erro para criar ViagemTableViewCell")}
            viagem.configuraCelulas(viewModel?.viagens[indexPath.row])
            return viagem
        case .ofertas:
            guard let oferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {fatalError("Erro para criar OfertaTableViewCell")}

            return oferta
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let primeiraSessaoDaView = 0
        
        if (section == primeiraSessaoDaView) {
            let cabecalhoView = Bundle.main.loadNibNamed("CabecalhoView", owner: self, options: nil)?.first as? CabecalhoView
            cabecalhoView?.configurarView()
            
            return cabecalhoView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let primeiraSessaoDaView = 0
        
        if (section == primeiraSessaoDaView) {
            return 300
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

