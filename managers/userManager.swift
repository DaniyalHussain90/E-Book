//
//  userManager.swift
//  E-book
//
//  Created by Daniyal Hussain on 26/11/2021.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase


class  userManager{
  
    
    let db = Firestore.firestore()
    var ref:DocumentReference? = nil
    static let shared = userManager()
 //   var ref: DatabaseReference!

    func createUser(user:User?,completion:@escaping(User?,String?)->Void){

        Auth.auth().createUser(withEmail: user?.name ?? "", password: user?.password ?? "") { authResult, error in
                
                if error == nil {
                    completion(user, nil)
                }else {
                    let authError = error?.localizedDescription
                    completion(nil,authError)
                }
            }
        }
    
        
    func socialLogin(credential:AuthCredential, provider: String,completion:@escaping(Bool?,String?)->Void){
        
        var ref = Database.database().reference()

        Auth.auth().signIn(with: credential) { [self] (authResult, error) in
            if error == nil {
                
                let dataDic:[String:Any] = [
                    "email"  : "\(authResult?.user.email ?? "")",
                    "name"   : "\(authResult?.user.displayName ?? "")",
                  //  "provider": "\(provider)",
                    "imageURL" : "https://firebasestorage.googleapis.com/v0/b/trav-80401.appspot.com/o/no-image.png?alt=media&token=d5a0a91e-1396-4c7a-ad0b-049cae0ca778"
                ]
                
                
              
//                self.db.collection("Users").addSnapshotListener { snap, error in
//                    if  error != nil {
//                        completion(nil, error?.localizedDescription)
//                    }else{
//                        for document in snap!.documents {
//
//                            if document.documentID == authResult?.user.uid ?? "" {
//                                print("user already exists")
//                                completion(true,nil)
//                            }else {
//
//                            }
//
//                        }
//                    }
//                }
                ref.child("users").child(authResult?.user.uid ?? "").setValue(dataDic) { error, ref in
                    
                }
//                self.db.collection("Users").document(authResult?.user.uid ?? "").setData(dataDic) {
//                    err in
//                    if let err = err
//                    {
//                        print("Error : \(err.localizedDescription)")
//                        completion(false,err.localizedDescription)
//                    }
//                    else
//                    {
//                        print("Created")
//                        completion(true,nil)
//                    }
//                }
            }else{
                completion(false,error?.localizedDescription)
            }
        }
        
        
    }
    
    func getUser(completion:@escaping(User?,String?)->Void){
        let user = (Auth.auth().currentUser?.uid)!
        var ref: DatabaseReference!

        ref = Database.database().reference()
        ref.child("user").child(user).observeSingleEvent(of: .value) { snap in
            let value = snap.value as? NSDictionary
            //  let username = value?["username"] as? String ?? ""
            //  let user = User(username: username)
            print(snap.key)
        }

//        ref!.getDocument { document, error in
//        //    if let document = document, document.exists {
//            let document = document!
//            print("Document data: \(document.documentID)")
//      //      }
//
//        //    else {
//            print("(document.documentID) => \(document.data())")
//
//
//       //     }
//        }

        }
  }
