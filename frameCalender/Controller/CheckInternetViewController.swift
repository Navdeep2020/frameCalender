//
//  CheckInternetViewController.swift
//  frameCalender
//
//  Created by Navdeep Singh on 11/05/23.
//

import UIKit

class CheckInternetViewController: UIViewController {

    let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            }
            self.reachability.whenUnreachable = { _ in
                print("Not reachable")
            }

            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
    
    deinit{
        reachability.stopNotifier()
    }
}
