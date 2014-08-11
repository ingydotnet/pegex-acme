exports.MODULE = 'Pegex'
exports.VERSION = '0.0.1'

Pegex = {}
Pegex.Tree = {}

Pegex.Parser = require('./pegex/parser').Pegex.Parser
Pegex.Input = require('./pegex/input').Pegex.Input

pegex = (grammar, receiver)->
  grammar ?
    throw "Argument 'grammar' required in function 'pegex'"
  if typeof(grammar) == 'string' or grammar instanceof Pegex.Input
    Pegex.Grammar = require('./pegex/grammar').Pegex.Grammar
    grammar = new Pegex.Grammar grammar
  if ! receiver
    Pegex.Tree.Wrap = require('.pegex/tree/wrap').Pegex.Tree.Wrap
    receiver = new Pegex.Tree.Wrap
  else if typeof(grammar) == 'string'
    receiver_class = require("./#{receiver.replace '::', '/'}")
    receiver = new receiver_class
  new Pegex.Parser grammar, receiver

exports.pegex = pegex
