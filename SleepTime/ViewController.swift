//
//  ViewController.swift
//  SleepTime
//
//  Created by Rajkumar Gurunathan on 19/06/24.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var wakeTextField: UITextField!
    @IBOutlet weak var estimatedSleepTextField: UITextField!
    @IBOutlet weak var coffeeTextField: UITextField!
    @IBOutlet weak var actualSleepLabel: UILabel!

    let sleepModel = SleepPredictor()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func predictSleep(_ sender: UIButton) {
        guard let wake = Double(wakeTextField.text ?? ""),
              let estimatedSleep = Double(estimatedSleepTextField.text ?? ""),
              let coffee = Double(coffeeTextField.text ?? "") else {
            return
        }

        do {
            let prediction = try sleepModel.prediction(wake: Int64(wake), estimatedSleep: estimatedSleep, coffee: Int64(coffee))
            actualSleepLabel.text = "Predicted Actual Sleep: \(prediction.actualSleep)"
        } catch {
            print("Error making prediction: \(error.localizedDescription)")
        }
    }
}


