//
//  RootViewController.swift
//  NavigationAula
//
//  Created by Luma Gabino Vasconcelos on 06/05/19.
//  Copyright © 2019 Anthony Marques Gianeli. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Foundation

class MainViewController: BaseViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var button, button2, button3 : UIButton!
    var buttonAtual : UIButton?
    
    
    let CellIdentifier = "CellIdentifier"
    var words: [String] = []
    var descricoes: [String] = []
    var imagens: [UIImage] = []
    var slides: [UIImage] = []
    var frame = CGRect(x:0,y:0,width: 0,height: 0)
    var detalhe: DetalhesEventosViewController?
    

    
    @objc func button1Tapped(sender: UIButton) {
        buttonAtual = button
        print("button1Tapped")
        playVideo()
    }
    @objc func button2Tapped(_ sender: UIButton) {
        buttonAtual = button2
        print("button2Tapped")
        playVideo()
    }
    @objc func button3Tapped(_ sender: UIButton) {
        buttonAtual = button3
        print("button3Tapped")
        playVideo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Titles
        words.append("Treinamento")
        words.append("Bem Vindos à Synvia")
        words.append("Treinamento Financeiro")
        words.append("Treinamento Devs")
        words.append("Estratégias de Marketing Digital")
        
        //Descritions
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        descricoes.append("Por Danilo")
        
        //images
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
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //SrollView
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let size = scrollView.frame.size
        let origin = CGPoint.zero
        let frame = CGRect(origin: origin, size: size)
        
        
        
        button = UIButton(type: .custom)
        button.frame = frame
        button.setBackgroundImage(UIImage(named: "Fotolia_120871392_Subscription_Monthly_XXL"), for: .normal)
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        scrollView.addSubview(button)
        
        button2 = UIButton(type: .custom)
        button2.frame = frame.offsetBy(dx: size.width, dy: 0)
        button2.setBackgroundImage(UIImage(named: "Fotolia_120871495_Subscription_Monthly_XXL"), for: .normal)
        button2.addTarget(self, action: #selector(self.button2Tapped(_:)), for: .touchUpInside)
        
        scrollView.addSubview(button2)
        
        button3 = UIButton(type: .custom)
        button3.frame = frame.offsetBy(dx: size.width * 2, dy: 0)
        button3.setBackgroundImage(UIImage(named: "Fotolia_120890120_Subscription_Monthly_XL"), for: .normal)
        button3.addTarget(self, action: #selector(self.button3Tapped(_:)), for: .touchUpInside)
        
        scrollView.addSubview(button3)
        
        scrollView.contentSize = CGSize(width: size.width * 3, height: size.height)
        scrollView.delegate = self
        
        scrollView.setContentOffset(CGPoint.zero, animated: true)
        scrollView.isPagingEnabled = true
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    func loadScrollView() {
        
        self.scrollView.layer.borderColor = UIColor.white.cgColor
        self.scrollView.layer.shadowColor = UIColor.black.cgColor
        
        //uso está sendo apenas visual
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    // fim
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //print("O view controller é \(self)")
    }
    
    @IBAction func hereAndBackAgain(_ segue: UIStoryboardSegue) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let destination = segue.destination as? DetalhesEventosViewController{
                destination.image = self.buttonAtual?.backgroundImage(for: .normal)
                
                if buttonAtual == button{
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            self.detalhe?.descricao.text = "ïmage"
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image"
                                print ("entrou")
                            }
                        }
                    }
                }
                else if buttonAtual == button2{
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image2"
                            }
                        }
                    }
                } else if buttonAtual == button3 {
                    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                        if segue.identifier == "detailSegue"{
                            if let child = segue.destination as? DetalhesEventosViewController{
                                child.text = "image3"
                            }
                        }
                    }
                }
            }
        }
    }
    @IBAction func buttonPressed(_ sender: Any) {
        self.playVideo()
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "", ofType:"mp4") else {
//            debugPrint("1 - Tutorial Clockify.mp4")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}

// MARK: - TableView
extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CellEventos
        
        let word = words[indexPath.row]
        let descricao = descricoes[indexPath.row]
        
        // Configure cell of TableView
        cell.title.text = word
        cell.descricao.text = descricao
        cell.imagem.image = imagens [indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
