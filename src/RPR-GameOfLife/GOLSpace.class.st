"
I represent the Bloc space where the Game of Life is running

"
Class {
	#name : #GOLSpace,
	#superclass : #BlSpace,
	#instVars : [
		'cols',
		'rows',
		'grid',
		'age',
		'cellsGap',
		'headerGap'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLSpace >> boardHeight [
	"Default height of the game board"

	^ 600
]

{ #category : #accessing }
GOLSpace >> boardWidth [
	"Default width of the game board"

	^ 800
]

{ #category : #accessing }
GOLSpace >> defaultCellsGap [
"Separation between column and row lines in the game board"
	^ 20
]

{ #category : #initialization }
GOLSpace >> initialize [
	"Create and position the elements to display on the board. 
	 Adds the header and its control objects.      
	 Initialize the space instance variables.
	 Answer the new line"

	| headerElem |
	super initialize.
	age := 0.
	cellsGap := self defaultCellsGap.
	rows := self boardHeight / cellsGap.
	cols := self boardWidth / cellsGap.
	headerElem := GOLHeader age: age.
	headerGap := headerElem defaultHeight.
	self
		extent: self boardWidth @ (self boardHeight + headerGap);
		title: 'Conway''s Game of Life'.
	self root addChild: headerElem.
	grid := Array2D
		rows: rows
		columns: cols
		tabulate: [ :r :c | self newCellAt: c at: r ].
	1 to: cols do: [ :c | self newColumnLineAt: c ].
	1 to: rows do: [ :r | self newRowLineAt: r ].
	self show
]

{ #category : #'instance creation' }
GOLSpace >> newCellAt: c at: r [
	"Create a cell for position (c,r) and add it to my on-screen
	representation at the appropriate screen position. Answer the
	new cell"

	| cell |
	cell := GOLCell new
		relocate: ((c-1) * cellsGap + 1) @ ((r-1) * cellsGap + 1 + headerGap).
	self root addChild: cell.
	^ cell
]

{ #category : #'instance creation' }
GOLSpace >> newColumnLineAt: c [
	"Create a vertical line To delimit the end of column c in the board.
	Answer the new line"

	| line |
	line := GOLBoardLine
		from: (c * cellsGap) @ headerGap
		to: (c * cellsGap) @ (self boardHeight + headerGap).
	self root addChild: line.
	^ line
]

{ #category : #'instance creation' }
GOLSpace >> newRowLineAt: r [
	"Create an horizontal line To delimit the end of row r in the board.
	Answer the new line"

	| line |
	line := GOLBoardLine
			from: 0 @ (r * cellsGap + headerGap)
			to: self boardWidth @ (r * cellsGap + headerGap).
		self root addChild: line.
	^ line
]
