describe 'Link Grammar Tests', ->

	LinkGrammar = require __dirname + '/../../build/index.js'
	require 'should'

	linkGrammar = new LinkGrammar()
	
	linkage = linkGrammar.parse 'turn off the light'
		
	it 'should have the correct number of links', ->
		linkage.links[2].left.word.should.equal 'turn'
		linkage.links.length.should.equal 5

	it 'should have the correct tree', ->
		linkage.tree.child.child.label.should.equal 'turn'
	
	it 'should have word list', ->
		linkage.words.length.should.equal 6

	it 'should get link list by label', ->
		linkage.linksByLabel('MV').length.should.equal 1
		linkage.linksByLabel(/J/).length.should.equal 1

	it 'should get connector words', ->
		connectors = linkage.getConnectorWords 'off'
		connectors[0].source.label.should.equal 'MVp'
		connectors[0].target.label.should.equal 'MV'
		connectors[0].target.word.should.equal 'turn'
		connectors[0].target.type.should.equal 'v'
		connectors[1].source.label.should.equal 'J'
		connectors[1].target.label.should.equal 'Jp'
		connectors[1].target.word.should.equal 'light'
		connectors[1].target.type.should.equal 'n'