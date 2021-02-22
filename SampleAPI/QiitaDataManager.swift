//
//  QiitaDataManager.swift
//  SampleAPI
//
//  Created by 三浦　登哉 on 2021/02/22.
//

import Foundation

class QiitaDataManager {

    static func fetchArticle(completion: @escaping ([QiitaModel]) -> Void) {
        
        let url = "https://qiita.com/api/v2/items"
        
        let decoder = JSONDecoder()
        
        guard var urlCompoments = URLComponents(string: url) else { return }
        
        urlCompoments.queryItems = [URLQueryItem(name: "per_page", value: "50")]
    
        // データを取得
        let task = URLSession.shared.dataTask(with: urlCompoments.url!) { data, response, error in
            
            guard let jsonData = data else { return }
            
            do {
                let articles = try decoder.decode([QiitaModel].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
