//
//  MentorViewController.swift
//  NavigationAula
//
//  Created by João Victor Batista on 17/08/19.
//  Copyright © 2019 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit

class MentorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var courses = ["Amores Desvalidos", "Entre Lençóis", "Você e Eu Para Sempre", "Sara"]
    
    var coursesCompleteds = ["Inglês Básico", "Espanhol Básico"]
    
    var people    = ["Escrito por Rogério Athayde", "Escrito por Kevin Leman", "Escrito por Francis Chan e Lisa Chan", "Escrito por Helena Raquel"]
    
    
    var play = UIImage(named: "play-button-2")
    var completed = UIImage(named: "play-button-2")
    
    var thumbs = [UIImage(named: "livro1"),
                  UIImage(named: "livro2"),
                  UIImage(named: "livro3"),
                  UIImage(named: "livro4")]
    
    var study = [UIImage(named: "ingles"),
                  UIImage(named: "espanhol")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    @objc func swipeLeft(_ gesture: UISwipeGestureRecognizer) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            segmentedControl.selectedSegmentIndex = 1
            tableView.reloadData()
        } else {
            return
        }
    }
    
    @objc func swipeRight(_ gesture: UISwipeGestureRecognizer) {
        
        if segmentedControl.selectedSegmentIndex == 1 {
            segmentedControl.selectedSegmentIndex = 0
            tableView.reloadData()
        } else {
            return
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            return courses.count
        } else {
            return coursesCompleteds.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Curso", for: indexPath) as! MentorTableViewCell

        
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.curso.text = courses[indexPath.row]
            cell.autor.text = people[indexPath.row]
            cell.thumb.image = thumbs[indexPath.row]
            cell.play.image = play
            cell.progress.progress = 0.5

        } else {
            cell.curso.text = coursesCompleteds[indexPath.row]
            cell.autor.text = people[indexPath.row]
            cell.thumb.image = study[indexPath.row]
            cell.play.image = completed
            cell.progress.progress = 1.0
        }
        
        return cell
    }
    
    @IBAction func valueChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    
}
