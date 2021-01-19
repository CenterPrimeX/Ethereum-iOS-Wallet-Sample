//
//  ExportKeystoreVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class ExportKeystoreVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletTxtField: UITextField!
    @IBOutlet weak var keystoreUTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func exportBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        do{
            /**
                if function successfully completes result can be caught in this block
             */
            keystoreUTextView.text = try eth.exportKeystore(walletAddress: walletTxtField.text!)
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = keystoreUTextView.text
    }
}
extension ExportKeystoreVC {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ExportKeystoreVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
