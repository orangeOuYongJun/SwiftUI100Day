//
//  FileManager-Document.swift
//  Day77ChallengeProject
//
//  Created by OrangeOu on 9/11/23.
//

import Foundation

extension FileManager {
    var getDocumentDir: URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func fileNameInDocumentsDir(_ fileName: String) -> URL {
        return self.getDocumentDir.appendingPathComponent(fileName)
    }
}
