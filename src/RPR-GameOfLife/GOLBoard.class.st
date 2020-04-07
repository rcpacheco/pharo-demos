Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#instVars : [
		'cols',
		'rows'
	],
	#category : #'RPR-GameOfLife'
}

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
	| line size |
	size := 20.
	super initialize.
	rows := self defaultHeight / size.
	cols := self defaultWidth / size.
	self
		background: Color lightYellow;
		constraintsDo: [ :c | 
			c horizontal exact: self defaultWidth.
			c vertical exact: self defaultHeight ].
	1 to: cols do: [ :c | 
		line := GOLBoardLine
			from: (c * size) @ 0
			to: (c * size) @ self defaultHeight.
		self addChild: line ].
	1 to: rows do: [ :r | 
		line := GOLBoardLine
			from: 0 @ (r * size)
			to: self defaultWidth @ (r * size).
		self addChild: line ]
]

{ #category : #initialization }
GOLBoard >> resolution [ 
^ 4
]
