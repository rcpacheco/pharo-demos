Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#instVars : [
		'gameModel'
	],
	#category : #'RPR-GameOfLife-Elements'
}

{ #category : #'instace creation' }
GOLBoard class >> bigBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 800 @ 640
]

{ #category : #'instace creation' }
GOLBoard class >> createWithSize: aPoint [
	"Creates a board with a specific size"

	| aModel board |
	aModel := GOLGameModel new.

	board :=  GOLBoard new
		size: aPoint;
		gameModel: aModel;
		forceLayout;
		addLinesAndCells;
		yourself.
		
	aModel gridSize: board sizeInCellsAndRows.
	
	aModel announcer
		when: GOLCellsEvolvedAnnouncement
		send: #onEvolved
		to: board.	
			^board	
]

{ #category : #'instace creation' }
GOLBoard class >> defaultBoard [
	"Creates a board with the default dimensions"

	<gtExample>
	^ GOLBoard bigBoard
]

{ #category : #'instace creation' }
GOLBoard class >> mediumBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 600 @ 480
]

{ #category : #'instace creation' }
GOLBoard class >> smallBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 400 @ 320
]

{ #category : #adding }
GOLBoard >> addLinesAndCells [
	| cols rows |
	cols := self width / self cellsGap.
	rows := self height / self cellsGap.
	1 to: cols do: [ :c | 
		self
			addChild:
				(GOLBoardLine
					from: (c * self cellsGap) @ 0
					to: (c * self cellsGap) @ self height) ].
	1 to: rows do: [ :r | 
		self
			addChild:
				(GOLBoardLine
					from: 0 @ (r * self cellsGap)
					to: self width @ (r * self cellsGap)) ].
	1 to: cols do:
		[ :c | 1 to: rows do: [ :r | self newCellAt: c at: r model: gameModel ] ]
]

{ #category : #initialization }
GOLBoard >> cellsGap [
	"Separation between column and row lines in the game board"

	^ 20
]

{ #category : #accessing }
GOLBoard >> gameModel [
	^ gameModel
]

{ #category : #accessing }
GOLBoard >> gameModel: anObject [
	gameModel := anObject
]

{ #category : #accessing }
GOLBoard >> getAllCells [
^ self children select: [ :ch | ch class = GOLCell]
]

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self
		background: Color lightYellow
]

{ #category : #'instance creation' }
GOLBoard >> newCellAt: c at: r model: aGameModel [
	"Create a cell for position (c,r), defines its location in the board and
	 creates an event handler to update the game model when the cell state changes."

	| cell |
	cell := GOLCell new
		location: c @ r;
		addEventHandler: (self newToogledCellEventListener gameModel: aGameModel);
		relocate: ((c - 1) * self cellsGap + 1) @ ((r - 1) * self cellsGap + 1).
	self addChild: cell.
	^ cell
]

{ #category : #initialization }
GOLBoard >> newColumnLineAt: c [
	"Create a vertical line To delimit the end of column c in the board.
	Answer the new line"

	| line |
	line := GOLBoardLine
		from: (c * self cellsGap) @ 0
		to: (c * self cellsGap) @ (self height).
	self addChild: line.
	^ line
]

{ #category : #initialization }
GOLBoard >> newRowLineAt: r [
	"Create an horizontal line To delimit the end of row r in the board.
	Answer the new line"

	| line |
	line := GOLBoardLine
		from: 0 @ (r * self cellsGap)
		to: self width @ (r * self cellsGap).
	self addChild: line.
	^ line
]

{ #category : #'instance creation' }
GOLBoard >> newToogledCellEventListener [
	^ GOLToogledCellEventListener new
]

{ #category : #'announcement - handling' }
GOLBoard >> onEvolved [
		self  refreshAllCells 
]

{ #category : #drawing }
GOLBoard >> refreshAllCells [
	self getAllCells
		do: [ :cell | 
			(self gameModel isAlliveCellAt: cell location)
				ifTrue: [ cell setAlive ]
				ifFalse: [ cell setDead ] ]
]

{ #category : #accessing }
GOLBoard >> sizeInCellsAndRows [

^ (self width/ self cellsGap) @ (self height / self cellsGap)
]
