//
//  FileReader.swift
//  Internationalizer
//
//  Created by Daniel Sumara on 28.02.2017.
//  Copyright © 2017 Daniel Sumara. All rights reserved.
//

import Foundation

class FileReader  {
    
    // MARK:- Properties
    
    private let chunkSize: Int
    private let delimData: Data
    private let encoding: String.Encoding
    
    private var buffer: Data
    private var eof: Bool = false
    private var fileHandle: FileHandle!
    
    // MARK:- Lifecycle
    
    init(for path: URL) {
        encoding = .utf8
        chunkSize = 4096
        buffer = Data(capacity: chunkSize)
        
        guard let fileHandle = FileHandle(forReadingAtPath: path.path), let delimData = "\n".data(using: encoding) else {
            fatalError()
        }
        
        self.delimData = delimData
        self.fileHandle = fileHandle
    }
    
    deinit {
        print("\(String(describing: self)) deinited")
        close()
    }
    
    // MARK:- API
    
    /// Return next line, or nil on EOF.
    func nextLine() -> String? {
        precondition(fileHandle != nil, "Attempt to read from closed file")
        
        // Read data chunks from file until a line delimiter is found:
        while !eof {
            if let range = buffer.range(of: delimData) {
                let line = String(data: buffer.subdata(in: 0 ..< range.lowerBound), encoding: encoding)
                buffer.removeSubrange(0 ..< range.upperBound)
                return line
            }
            
            let tmpData = fileHandle.readData(ofLength: chunkSize)
            if tmpData.count > 0 {
                buffer.append(tmpData)
            } else {
                eof = true
                if buffer.count > 0 {
                    let line = String(data: buffer as Data, encoding: encoding)
                    buffer.count = 0
                    return line
                }
            }
        }
        
        return nil
    }
    
    /// Start reading from the beginning of file.
    func rewind() {
        fileHandle.seek(toFileOffset: 0)
        buffer.count = 0
        eof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}

extension FileReader: Sequence {
    
    func makeIterator() -> AnyIterator<String> {
        return AnyIterator { [weak self] in
            return self?.nextLine()
        }
    }
    
}
