//
//  URLManager.swift
//  BPIWell
//
//  Created by Danila on 06.07.2023.
//

import Foundation

func getBPIWell(url: String, req: String) async throws -> [String]{
    guard let url = URL(string: url) else {
        return ["Error url"]
    }
    
    let request = URLRequest(url: url)
    
    let (data, _) = try await URLSession.shared.data(for: request)
    print(data)
    let well = try JSONDecoder().decode(BPIWell.self, from: data)
    print(well)
    
    switch req{
    case "updated":
        print(well.time.updated)
        return [well.time.updated]
        
    case "USD":
        return [
            well.bpi.USD.code,
            well.bpi.USD.rate
        ]
    case "GBP":
        return [
            well.bpi.GBP.code,
            well.bpi.GBP.rate
        ]
    case "EUR":
        return [well.bpi.EUR.code,
                well.bpi.EUR.rate
        ]
    default:
        return ["Error Request"]
    }
}
