import Foundation

class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(remixer: Remixer?) {
        if remixer != nil {
            self.phrases = remixer!.result(self.phrases)
        }
    }
    
    func line(number: Int) -> String {
        let linePhrases = self.phrases[0...number-1].reverse()
        let line = linePhrases.joinWithSeparator(" ")
        return self.lineStart + line + self.lineEnd
    }
    
    func recite() -> String {
        var lines = [String]()
        for i in 1...self.phrases.count {
            lines.append(self.line(i))
        }
        return lines.joinWithSeparator("\n")
    }
}

protocol Remixer {
    func result(list: [String]) -> [String]
}

class Repeater: Remixer {
    func result(list: [String]) -> [String] {
        return list.map {
            return $0 + " " + $0
        }
    }
}

class Reverser: Remixer {
    func result(list: [String]) -> [String] {
        return list.reverse()
    }
}

Song(remixer: nil).recite()
Song(remixer: Repeater()).recite()
Song(remixer: Reverser()).recite()