as yet unclassified
setBlockOops
  super setBlockOops.
  self getBlock ifNotNil: [ :block | getBlockOop := block asOop ].
  self setBlock ifNotNil: [ :block | setBlockOop := block asOop ].