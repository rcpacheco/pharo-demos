Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instace creation' }
GOLBoard class >> bigBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 600 @ 480
]

{ #category : #'instace creation' }
GOLBoard class >> createWithSize: aPoint [
	"Creates a board with a specific size"

	^ GOLBoard new size: aPoint; addLines; yourself.

]

{ #category : #'instace creation' }
GOLBoard class >> hugeBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 800 @ 640
]

{ #category : #'instace creation' }
GOLBoard class >> mediumBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 400 @ 320
]

{ #category : #'instace creation' }
GOLBoard class >> smallBoard [
	"Creates a board with a specific size"

	<gtExample>
	^ GOLBoard createWithSize: 200 @ 160
]

{ #category : #adding }
GOLBoard >> addLines [
	| cols rows |
	cols := self getSize x / self cellsGap.
	rows := self getSize y / self cellsGap.
	1 to: cols do: [ :c | 
		self
			addChild:
				(GOLBoardLine
					from: (c * self cellsGap) @ 0
					to: (c * self cellsGap) @ self getSize y) ].
	1 to: rows do: [ :r | 
		self
			addChild:
				(GOLBoardLine
					from: 0 @ (r * self cellsGap)
					to: self getSize x @ (r * self cellsGap)) ]
]

{ #category : #initialization }
GOLBoard >> cellsGap [
	"Separation between column and row lines in the game board"

	^ 20
]

{ #category : #accessing }
GOLBoard >> getSize [
	| aLayoutConstraints |
	aLayoutConstraints := self constraints.
	(aLayoutConstraints horizontal resizer isExact
		and: [ aLayoutConstraints vertical resizer isExact ])
		ifTrue: [ ^ (aLayoutConstraints horizontal resizer size) @ (aLayoutConstraints vertical resizer size)].
		^ self extent
]

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self
		size: 200 asPoint;
		background: Color lightYellow
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
