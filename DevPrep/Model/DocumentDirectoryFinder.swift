//
//  DocumentDirectoryFinder.swift
//  DevPrep
//
//  Created by Andy Couto on 12/1/22.
//

import Foundation

protocol DocumentDirectoryFinder
{
    func getDocumentsDirectory() -> URL
}

extension DocumentDirectoryFinder
{
    func getDocumentsDirectory() -> URL
    {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
