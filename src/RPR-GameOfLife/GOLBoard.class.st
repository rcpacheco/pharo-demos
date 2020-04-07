Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#instVars : [
		'cols',
		'rows'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLBoard >> cellsGap [
	^ 20
]

{ #category : #accessing }
GOLBoard >> defaultHeight [
	^ 600
]

{ #category : #accessing }
GOLBoard >> defaultWidth [
	^ 800
]

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self initializeElementsAndAppearance.
	self initializeInteractivity.
]

{ #category : #initialization }
GOLBoard >> initializeElementsAndAppearance [
	| line cell |
	rows := self defaultHeight / self cellsGap.
	cols := self defaultWidth / self cellsGap.
	self
		background: Color lightYellow;
		constraintsDo: [ :c | 
			c horizontal exact: self defaultWidth.
			c vertical exact: self defaultHeight ].
	1 to: cols do: [ :c | 
		line := GOLBoardLine
			from: (c * self cellsGap) @ 0
			to: (c * self cellsGap) @ self defaultHeight.
		self addChild: line ].
	1 to: rows do: [ :r | 
		line := GOLBoardLine
			from: 0 @ (r * self cellsGap)
			to: self defaultWidth @ (r * self cellsGap).
		self addChild: line ].
		0 to: cols -1  do: [ :c | 
		0 to: rows -1 do: [ :r | 
			cell := GOLCell new relocate: (c * 20 + 1) @ (r * 20 + 1).
			self addChild: cell ] ]
]

{ #category : #initialization }
GOLBoard >> initializeInteractivity [
	"self
		addEventHandlerOn: BlMouseDownEvent
		do: [ :e | e target background: Color black ]"
]
