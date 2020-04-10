Class {
	#name : #GOLGameModel,
	#superclass : #Object,
	#instVars : [
		'gridSize',
		'statesHistory',
		'currentState'
	],
	#category : #'RPR-GameOfLife'
}

{ #category : #'instance creation' }
GOLGameModel class >> rows: rows columns: cols [
	"Generate a model with dimentios defined by the arguments cols and rows"

	^ self new gridSize: cols @ rows
]

{ #category : #'accessing structure variables' }
GOLGameModel >> cols [
	"Returns the number of columns of the grid model"
^ gridSize x
]

{ #category : #accessing }
GOLGameModel >> currentState [
"Gives access to the current state of the model, using lazy initialization"

  currentState ifNil: [ 
		currentState := OrderedCollection new.
  ].
^ currentState
]

{ #category : #initialization }
GOLGameModel >> defaultGridSize [
	"Define default size of the game's grid, if no other dimentions are given on model creation"

	^ 800 @ 600
]

{ #category : #accessing }
GOLGameModel >> gridSize [
	"Gives acces to the size of the game's grid"

	^ gridSize
]

{ #category : #accessing }
GOLGameModel >> gridSize: anObject [
"Set the size of the grid"
	gridSize := anObject
]

{ #category : #initialization }
GOLGameModel >> initialize [
	"Set te initial conditions of the model, excepts for the instance variable currentState,
	 that uses lazy initialization, in case a diferent grid size has been set using a class constructor"

	gridSize := self defaultGridSize.
	statesHistory := OrderedCollection new.
	
]

{ #category : #'accessing structure variables' }
GOLGameModel >> rows [ 

^ gridSize x
]

{ #category : #initialization }
GOLGameModel >> setInitialState [


]