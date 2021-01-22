//
//  ImportByKeystore.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK

class ImportByKeystore: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var keystoreTxtView: UITextView! {
        didSet {
            keystoreTxtView.layer.borderWidth = 2.0
            keystoreTxtView.layer.cornerRadius = 5.0
            keystoreTxtView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    @IBOutlet weak var passwordUiLabel: UITextField!
    @IBOutlet weak var walletAddressTxtField: UILabel!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func importBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
        * Using this importByKeystore function user can import his wallet from keystore.
        *
        * @param keystore - keystore JSON file
        * @param password - password of provided keystore
        *
        * @return walletAddress
        */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let walletAddress = try eth.importByKeystore(keystore: keystoreTxtView.text!, password: passwordUiLabel.text!)
            walletAddressTxtField.text = walletAddress?.walletAddress
            copyBtnOutlet.isHidden = false
        }catch{
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = walletAddressTxtField.text
    }
}

