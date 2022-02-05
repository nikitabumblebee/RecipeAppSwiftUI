//
//  Persistence.swift
//  RecipeSaver
//
//  Created by nikita.shmelev on 05.02.2022.
//

import Foundation
import Combine

fileprivate struct Envelope: Codable {
  let recipes: [Recipe]
}

class Persistence {
  var localFile: URL {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("recipes.json")
    return fileURL
  }
  
  var defaultFile: URL {
    return Bundle.main.url(forResource: "default", withExtension: "json")!
  }
  
  private func clear() {
    try? FileManager.default.removeItem(at: localFile)
  }
  
  func load() -> AnyPublisher<[Recipe], Never> {
    if FileManager.default.fileExists(atPath: localFile.standardizedFileURL.path) {
      return Future<[Recipe], Never> { promise in
        self.load(self.localFile) { recipes in
          DispatchQueue.main.async {
            promise(.success(recipes))
          }
        }
      }.eraseToAnyPublisher()
    } else {
      return loadDefault()
    }
  }
  
  func save(reipes: [Recipe]) {
    let envelope = Envelope(recipes: reipes)
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try! encoder.encode(envelope)
    try! data.write(to: localFile)
  }
  
  private func loadSynchronously(_ file: URL) -> [Recipe] {
    do {
      let data = try Data(contentsOf: file)
      let envelope = try JSONDecoder().decode(Envelope.self, from: data)
      return envelope.recipes
    } catch {
      clear()
      return loadSynchronously(defaultFile)
    }
  }
  
  private func load(_ file: URL, completion: @escaping ([Recipe]) -> Void) {
    DispatchQueue.global(qos: .background).async {
      let recipes = self.loadSynchronously(file)
      completion(recipes)
    }
  }
  
  func loadDefault(synchronous: Bool = false) -> AnyPublisher<[Recipe], Never> {
    if synchronous {
      return Just<[Recipe]>(loadSynchronously(defaultFile)).eraseToAnyPublisher()
    }
    return Future<[Recipe], Never> { promise in
      self.load(self.defaultFile) { recipes in
        DispatchQueue.main.async {
          promise(.success(recipes))
        }
      }
    }.eraseToAnyPublisher()
  }
}
