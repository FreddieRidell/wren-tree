class TreeEdges {
	static continueAndBranch  { "├── " }
	static goDown             { "│   " }
	static last               { "└── " }
}

class Node {
	toString { "Node" }

	construct new() {
		__indentation = 0
	}

	construct new(label){
		__indentation = 0
		_label = label
	}

	construct new(label, children){
		__indentation = 0
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
		__indentation = 0
	}

	construct new(label){
		__indentation = 0
		_label = label
	}

	construct new(label, children){
		__indentation = 0
		_label = label
		_children = children
	}
}

var tree = Tree.new()

var alpha = Node.new("alpha")
var beta = Node.new("beta")
var foo = Node.new("foo", [ alpha, beta ] )

var zeta = Node.new("zeta")
var gamma = Node.new("gamma")
gamma.addChild("2.txt")
gamma.addChild(zeta)

var bar = Node.new("bar", [ "1.txt", gamma ] )

var baz = Node.new("baz")

tree.addChild(bar)
tree.addChild(baz)
tree.addChild(foo)

System.print(tree)

/*
├── bar
│   ├── 1.txt
│   └── gamma
│       ├── 2.txt
│       └── zeta
├── baz
│   └── 3.txt
└── foo
    ├── alpha
    └── beta
*/
