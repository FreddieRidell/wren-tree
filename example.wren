import "./main" for Tree, Node

var tree = Tree.new()

var alpha = Node.new("alpha")
var beta = Node.new("beta")
var foo = Node.new("foo", [ alpha, beta ] )

var zeta = Node.new("zeta")
var gamma = Node.new("gamma")
gamma.addChild("2.txt")
gamma.addChild(zeta)

var bar = Node.new("bar", [ "1.txt", gamma ] )

var baz = Node.new("baz", ["3.txt"])

tree.addChild(bar)
tree.addChild(baz)
tree.addChild(foo)

System.print(tree)

System.print("
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
")

