import Foundation
import UIKit

class ListContactsViewModel {
    private let service = ListContactService()
    
    private var completion: (([Contact]?, Error?) -> Void)?
    
    init() { }
    
    func getNavigationBarTitle() -> String {
        String(localizedKey: "titleText")
    }
    
    func loadContacts(_ completion: @escaping ([Contact]?, Error?) -> Void) {
        self.completion = completion
        service.fetchContacts { contacts, err in
            self.handle(contacts, err)
        }
    }
    
    private func handle(_ contacts: [Contact]?, _ error: Error?) {
        if let e = error {
            completion?(nil, e)
        }
        
        if let contacts = contacts {
            completion?(contacts, nil)
        }
    }
    
    func getImageURl( urlPhoto: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: urlPhoto) { (data, _, error) in
            
            if let error {
                completion(.failure(error))
                return
            }
        
            guard let data else {
                completion(.failure(NSError(domain: "Error", code: 400)))
                return
            }
     
            completion(.success(data))
    
        }.resume()
        
    }

}
