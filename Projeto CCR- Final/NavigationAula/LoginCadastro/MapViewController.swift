//
//  MapViewController.swift
//  NavigationAula
//
//  Created by anthony gianeli on 14/06/20.
//  Copyright © 2020 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var filterTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var pickerView = UIPickerView()
    var selectedFilter: String?
    var filters = ["Restaurantes", "Ponto de Descanso", "Centro Médico", "Manutenção"]
    var selectedIndexForPicker: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMapView()
        setupPickerView()
    }
    
    func prepareMapView() {
        
        mapView?.delegate = self
        mapView?.showsUserLocation = true
    }
    
    func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        filterTextField.inputView = pickerView
        //creating a toolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        //creating a flexible space to put the done button on the toolbar's right side
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //creating done button
        let doneButton = UIBarButtonItem(title: "Concluido", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        
        //putting the flexible space and the done button into the toolbar
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
    }
    
    @objc func donePicker() {
        self.view.endEditing(true)
    }
    
    @IBAction func qrCodeAction(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func sosAction(_ sender: UIButton) {
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            self.selectedFilter = filters[row]
            filterTextField.text = String(filters[row])
        
        // Update the array to know what row did the picker stop
//        selectedIndexForPicker[filterTextField?.rawValue ?? 0] = row
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return filters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        

            return filters[row]
    }
}

extension MapViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

}
