Class {
	#name : #GOLSparseMatrix,
	#superclass : #Object,
	#instVars : [
		'dict',
		'width',
		'height'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLSparseMatrix >> dict [
	^ dict
]

{ #category : #accessing }
GOLSparseMatrix >> dict: anObject [
	dict := anObject
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
	"Defines a Dictionary to store the sparse matrix values using the alive cell's location points as keys"

    dict := Dictionary new
]

{ #category : #initialization }
GOLSparseMatrix >> isAlliveCellAt: aPoint [
	"Returns true if key for aPont with value true exists, otherwise returns false."
	
	^ dict at: aPoint  ifAbsent: [ false ].

]

{ #category : #initialization }
GOLSparseMatrix >> setCellStateAt: aPoint value: aValue [
	"Sets a cell state. If aValue puts the value in the dictionary using aPoint as key.
	 If aValue is false and the cell was alive, 
	 it removes it's key location from the dictionary; if not, it does nothing."
	
	aValue 
		ifTrue: [ dict at: aPoint put: aValue ] 
		ifFalse: [ dict removeKey: aPoint ifAbsent: [ true] ].

]

{ #category : #accessing }
GOLSparseMatrix >> width [
	^ width
]

{ #category : #accessing }
GOLSparseMatrix >> width: anObject [
	width := anObject
]
