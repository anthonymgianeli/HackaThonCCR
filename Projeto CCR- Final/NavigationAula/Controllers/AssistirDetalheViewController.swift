//
//  AssistirDetalheViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 18/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class AssistirDetalheViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var detailTitle: String?
    @IBOutlet weak var navItem: UINavigationItem!
    
    var words: [String] = []
    var descricoes: [String] = []
    var imagens: [UIImage] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navItem.title = detailTitle
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        words.append("Treinamento RH")
        words.append("Bem Vindos à Synvia")
        words.append("Treinamento Financeiro")
        words.append("Treinamento Devs")
        words.append("Marketing Digital")
        
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        
        if let imagem = UIImage(named: "Fotolia_120871392_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120871495_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890120_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890380_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_120890426_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220554851_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220558115_Subscription_Monthly_XL"){
            imagens.append(imagem)
        }
        if let imagem = UIImage(named: "Fotolia_220763802_Subscription_Monthly_XXL"){
            imagens.append(imagem)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! CellEventos
        
        
        // Configure cell of TableView
        cell.title.text = words[indexPath.row]
        cell.descricao.text = descricoes[indexPath.row]
        cell.imagem.image = imagens[indexPath.row]
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "video", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "video",
            let detailVC = segue.destination as? VideoViewController{
            if let videoIndex = sender as? Int {
                print(imagens)
                print(videoIndex)
                detailVC.auxThumb = imagens[videoIndex]
                detailVC.auxTitle   = words[videoIndex]
                detailVC.navItem.backBarButtonItem?.title = detailTitle
            }
        }
    }
    
    

    

}
