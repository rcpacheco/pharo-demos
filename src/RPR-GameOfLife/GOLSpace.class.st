Class {
	#name : #GOLSpace,
	#superclass : #BlSpace,
	#instVars : [
		'cols',
		'rows',
		'grid',
		'age',
		'cellsGap'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLSpace >> boardHeight [
	^ 600
]

{ #category : #accessing }
GOLSpace >> boardWidth [
	^ 800
]

{ #category : #initialization }
GOLSpace >> initialize [
	super initialize.
	self initializeElementsAndAppearance.
	self initializeInteractivity.
	self show
]

{ #category : #initialization }
GOLSpace >> initializeElementsAndAppearance [
	| headerElem line cell |
	age := 0.
	cellsGap := 20.
	headerElem := GOLHeader age: age.
	self
		extent: self boardWidth @ (self boardHeight + headerElem defaultHeight);
		title: 'Conway''s Game of Life'.
	rows := self boardHeight / cellsGap.
	cols := self boardWidth / cellsGap.
	grid := Array2D rows: rows columns: cols.
	self root
		background: Color lightYellow;
		addChild: headerElem.
	"Add column lines"
	1 to: cols do: [ :c | 
		line := GOLBoardLine
			from: (c * cellsGap) @ headerElem defaultHeight
			to: (c * cellsGap) @ (self boardHeight + headerElem defaultHeight).
		self addChild: line ].
	"Add rows lines"
	1 to: rows do: [ :r | 
		line := GOLBoardLine
			from: 0 @ (r * cellsGap + headerElem defaultHeight)
			to: self boardWidth @ (r * cellsGap + headerElem defaultHeight).
		self addChild: line ].
	"Add cells"
	0 to: cols - 1 do: [ :c | 
		0 to: rows - 1 do: [ :r | 
			cell := GOLCell new
				relocate: (c * cellsGap + 1) @ (r * cellsGap + 1 + headerElem defaultHeight).
			self addChild: cell ] ]
]

{ #category : #initialization }
GOLSpace >> initializeInteractivity [
	
]
