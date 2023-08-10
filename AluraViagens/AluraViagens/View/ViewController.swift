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
        viagens.dataSource = self
        viagens.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {fatalError("Erro para criar ViagemTableViewCell")}
        
        return viagem
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cabecalhoView = Bundle.main.loadNibNamed("CabecalhoView", owner: self, options: nil)?.first as? CabecalhoView
        cabecalhoView?.configurarView()

        return cabecalhoView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

