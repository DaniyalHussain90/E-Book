//
//  loginVC.swift
//  E-book
//
//  Created by Daniyal Hussain on 22/11/2021.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseDatabase
import AuthenticationServices
class loginVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    
 
    @IBOutlet weak var tableView4: UITableView!
    let loginButton = FBLoginButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()

  //      loginButton.delegate = self
        tableView4.delegate = self
        tableView4.dataSource = self
        
        let nibcell=UINib(nibName: "loginTableview", bundle: nil)
        tableView4.register(nibcell, forCellReuseIdentifier: "loginTableview")
           }        // Do any additional setup after loading the view.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView4.dequeueReusableCell(withIdentifier: "loginTableview", for: indexPath) as? loginTableview
        cell?.googleButton.addTarget(self, action: #selector(googleButton), for: .touchUpInside)
        cell?.facebookButton.addTarget(self, action: #selector(HandleCustomFblogin), for: .touchUpInside)
        return cell!
    }
    
    
    @objc func googleButton (){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

          // ...
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                  let authError = error as NSError
                  if authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                    // The user is a multi-factor user. Second factor challenge is required.
                    let resolver = authError
                      .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                    var displayNameString = ""
                    for tmpFactorInfo in resolver.hints {
                      displayNameString += tmpFactorInfo.displayName ?? ""
                      displayNameString += " "
                    }
                   
                  }
                  // ...
                  return
                }
                
                
            //    User is signed in
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let myvc = storyBoard.instantiateViewController(withIdentifier: "cateVC") as! cateVC
                self.navigationController?.pushViewController(myvc, animated: true)
        
            }
        }
     
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 
     */
    
    }
 
    @objc func facebookButton (){
      
            let cell = tableView4.cellForRow(at: IndexPath(row: 0, section: 0)) as! loginTableview
            let user = User(name: cell.textView1.text, password: cell.textLabel?.text, UId: "")
            userManager.shared.createUser(user: user) { user, err in
                if err != nil {
                    
                }
                
                
            }
        }
        @objc func loginButton (sender: UIButton){
            let cell = tableView4.cellForRow(at: IndexPath(row: 0, section: 0)) as! loginTableview
            if cell.textView2.text != "" && cell.textView2.text != ""{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let myvc = storyBoard.instantiateViewController(withIdentifier: "cateVC") as! cateVC
                self.navigationController?.pushViewController(myvc, animated: true)
           
                
            }
         //   else{
       //         self.view.makeToast("Please Enter Email/Password")

            }
        
        @objc func HandleCustomFblogin(){
                   
                   LoginManager().logIn(permissions: ["email", "public_profile"], from: self)
                   { (Result,Error) in
                       if Error != nil {
                           print("Custom FB Login failed", Error)
                           return
                       }
                       self.showEmailAddresss()
                       
                   }
            
               }
        
        func showEmailAddresss() {
            let accessToken =  AccessToken.current
            guard let accessTokenString = accessToken?.tokenString else
            { return }
            let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            
            Auth.auth().signIn(with: credentails) { (user, error) in
                 if error  != nil {
    //                print("something went wrong with out FB user: ", error.debugDescription )
                 }
                  
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let myvc = storyBoard.instantiateViewController(withIdentifier: "cateVC") as! cateVC
                self.navigationController?.pushViewController(myvc, animated: true)
                 print("SuccessFully logged in with our user: ", user ?? "")
                }
                GraphRequest(graphPath: "/me", parameters: ["friends" : "id, name, email"]).start { (connection,  result, error) in
                            if error != nil {
                                print("failed to start graph request:", error ?? "")
                                return
                            }
                                print(result ?? "")
                        }

            }

}
