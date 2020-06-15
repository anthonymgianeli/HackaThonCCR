

import UIKit

class BaseViewController: UIViewController {
    
    var myOutlet: UIView? {
        get {
            return nil
        }
    }
    
    var name: String {
        get {
            return ""
        }
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        print("Criei o view controller \(name)")
//        //print("A view é \(self.view)")
//        print("Meu outlet é \(myOutlet)")
//
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        print("Acordei o view controller \(name)")
//        print("Meu outlet é \(myOutlet)")
//        print("A view é \(self.view)")
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print("View Did Load o view controller \(name)")
//        print("Meu outlet é \(myOutlet)")
//        print("A view é \(self.view)")
//
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        print("View Will Appear o view controller \(name)")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        print("View Did Appear o view controller \(name)")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//
//        print("View Did Disappear o view controller \(name)")
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        print("View Will Layout Subview o view controller \(name)")
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        print("View Did Layout Subview o view controller \(name)")
//    }
}
