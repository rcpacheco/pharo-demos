Class {
	#name : #GOLSparseMatrix,
	#superclass : #Object,
	#instVars : [
		'dict'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #initialization }
GOLSparseMatrix >> cellStateAt: aPoint value: aValue [
	"Sets a cell state. If aValue puts the value in the dictionary using aPoint as key.
	 If aValue is false and the cell was alive, 
	 it removes it's key location from the dictionary; if not, it does nothing."
	
	aValue 
		ifTrue: [ dict at: aPoint put: aValue ] 
		ifFalse: [ dict removeKey: aPoint ifAbsent: [ true] ].

]

{ #category : #accessing }
GOLSparseMatrix >> dict [
	^ dict
]

{ #category : #accessing }
GOLSparseMatrix >> dict: anObject [
	dict := anObject
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
