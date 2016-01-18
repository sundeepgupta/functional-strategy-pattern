class Song {
    private let lineStart = "This is "
    private let lineEnd = "."
    private var phrases = [
        "the house that Jack built",
        "the malt that lay in",
        "the rat that ate"
    ]
    
    init(remixer: Remixer?) {
        guard let r = remixer else { return }
        
        self.phrases = r(phrases)
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

typealias Remixer = [String] -> [String]

let repeater: Remixer = { lines in
    return lines.map {
        return $0 + " " + $0
    }
}

let reverser: Remixer = { lines in
    return lines.reverse()
}

Song(remixer: nil).recite()
Song(remixer: repeater).recite()
Song(remixer: reverser).recite()