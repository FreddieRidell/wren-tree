class TreeEdges {
	static continueAndBranch  { "├── " }
	static continue           { "│   " }
	static last               { "└── " }
	static blank              { "    " }
}

class Node {
	toString { stringify("", true) }

	stringify(baseIndentation, last){
		var acc = ""

		acc = acc + "%(_label)"

		for(child in _children){
			var isLast = child == _children[-1]
			var entryIndent = baseIndentation + ( isLast ? TreeEdges.last : TreeEdges.continueAndBranch )
			var childIndent = baseIndentation + ( isLast ? TreeEdges.blank : TreeEdges.continue )

			acc = acc + "\n%(entryIndent)"

			if(child is Node){
				acc = acc + "%(child.stringify(childIndent, isLast))"
			} else {
				acc = acc + "%(child)"
			}
		}

		return acc
	}

	construct new() {
		_label = ""
		_children = []
	}

	construct new(label){
		_label = label
		_children = []
	}

	construct new(label, children){
		_label = label
		_children = children
	}

	addChild(child){
		if(!_children) _children = []

		_children.add(child)
	}
}

class Tree is Node {
	construct new() {
		_label = "."
		_children = []
	}

	construct new(label){
		_label = label
		_children = []
	}

	construct new(label, children){
		_label = label
		_children = children
	}
}
