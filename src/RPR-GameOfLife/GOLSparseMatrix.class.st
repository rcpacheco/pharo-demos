Class {
	#name : #GOLSparseMatrix,
	#superclass : #Object,
	#instVars : [
		'content',
		'width',
		'height'
	],
	#category : #'RPR-GameOfLife-Model'
}

{ #category : #accessing }
GOLSparseMatrix >> content [
	^ content
]

{ #category : #accessing }
GOLSparseMatrix >> content: anObject [
	content := anObject
]

{ #category : #accessing }
GOLSparseMatrix >> height [
	^ height
]

{ #category : #accessing }
GOLSparseMatrix >> height: anObject [
	height := anObject
]

{ #category : #initialization }
GOLSparseMatrix >> initialize [
	"Defines a Set to store the  alive cell's location points. Only alive cells are stored."

	content := Set new
]

{ #category : #initialization }
GOLSparseMatrix >> isAlliveCellAt: aPoint [
	"Returns true if key for aPont with value true exists, otherwise returns false."

	^ content includes: aPoint
]

{ #category : #initialization }
GOLSparseMatrix >> isDeadCellAt: aPoint [
	"Returns true if a dead cell exist at the location aPoint."

	^ (self isAlliveCellAt: aPoint) not
]

{ #category : #initialization }
GOLSparseMatrix >> setCellStateAt: aPoint value: aValue [
	"Sets a cell state. If the value is true, aPoint is added to de content, otherwise is removed."

	aValue
		ifTrue: [ content add: aPoint ]
		ifFalse: [ content remove: aPoint ifAbsent: [  ] ].
		^content 
]

{ #category : #accessing }
GOLSparseMatrix >> width [
	^ width
]

{ #category : #accessing }
GOLSparseMatrix >> width: anObject [
	width := anObject
]
