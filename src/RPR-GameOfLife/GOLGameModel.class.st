Class {
	#name : #GOLGameModel,
	#superclass : #Object,
	#instVars : [
		'running',
		'age',
		'gridSize',
		'statesHistory',
		'currentState',
		'nextState',
		'deadNeighboars',
		'announcer'
	],
	#category : #'RPR-GameOfLife-Model'
}

{ #category : #accessing }
GOLGameModel >> age [
	^ age
]

{ #category : #accessing }
GOLGameModel >> announcer [
		^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GOLGameModel >> currentState [
	"Gives access to the current state of the model"

	^ currentState
]

{ #category : #accessing }
GOLGameModel >> currentState: anObject [
	currentState := anObject
]

{ #category : #accessing }
GOLGameModel >> deadNeighboars [
	^ deadNeighboars
]

{ #category : #lifecycle }
GOLGameModel >> doLastLife [
	self popLastStateFromHistory.
	age := age - 1.
	nextState reset.
	deadNeighboars removeAll
]

{ #category : #lifecycle }
GOLGameModel >> doNextLife [
	self pushCurrentStateToHistory.
	age := age + 1.
	currentState resetAndAddAll: nextState content.
	nextState reset.
	deadNeighboars removeAll
]

{ #category : #location }
GOLGameModel >> getAdjustedLocation: aPoint [
	^ ((aPoint x + gridSize x - 1) \\ gridSize x + 1)
		@ ((aPoint y + gridSize y - 1) \\ gridSize y + 1)
]

{ #category : #accessing }
GOLGameModel >> getAliveNeighborsAt: aPoint [
	^(self getNeighborsAt: aPoint)
		select:
			[ :adjustedLocation | self currentState isAlliveCellAt: adjustedLocation ]
]

{ #category : #accessing }
GOLGameModel >> getDeadNeighborsAt: aPoint [
	^(self getNeighborsAt: aPoint)
		reject:
			[ :adjustedLocation | self currentState isAlliveCellAt: adjustedLocation ]
]

{ #category : #accessing }
GOLGameModel >> getNeighborsAt: aPoint [
	^aPoint eightNeighbors
		collect: [ :location | self getAdjustedLocation: location ]
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
	"Set te initial conditions of the model, excepts for the gridSize, 
	 that hast to be set bup depending on the board size"

	running := false.
	age := 0.
	currentState := GOLSparseMatrix new.
	nextState := GOLSparseMatrix new.
	statesHistory := OrderedCollection new.
	deadNeighboars := Bag new
]

{ #category : #testing }
GOLGameModel >> isAlliveCellAt: aPoint [
	"Returns true if a cell is registered as alive, otherwise returns false."

	^ currentState isAlliveCellAt: aPoint
]

{ #category : #history }
GOLGameModel >> isHistoryEmpty [
	"SChecks if the states history is empty."

	^statesHistory isEmpty
]

{ #category : #accessing }
GOLGameModel >> isNotEmptyCurrentState [ 
	"SChecks if the states history is empty."

	^ currentState content isNotEmpty

]

{ #category : #accessing }
GOLGameModel >> isRunning [
^ running
]

{ #category : #lifecycle }
GOLGameModel >> lastLife [
	self isHistoryEmpty 
	ifFalse: [ 
		self 
			doLastLife;
			onLastLife
	]
		
]

{ #category : #lifecycle }
GOLGameModel >> nextLife [
	| cellsToKeepAlive aliveNeighbors cellsToBeBorn |
	cellsToKeepAlive := currentState content
		select: [ :cellLocation | 
			aliveNeighbors := self getAliveNeighborsAt: cellLocation.
			deadNeighboars addAll: (self getDeadNeighborsAt: cellLocation).
			aliveNeighbors size between: 2 and: 3 ].
	cellsToBeBorn := (deadNeighboars valuesAndCounts
		associationsSelect: [ :assoc | assoc value = 3 ]) keys.
	nextState addAll: cellsToKeepAlive.
	nextState addAll: cellsToBeBorn.
	self isNotEmptyCurrentState
				ifTrue: [
	self
		doNextLife;
		onNextLife
		]
]

{ #category : #accessing }
GOLGameModel >> nextState [
	^ nextState
]

{ #category : #accessing }
GOLGameModel >> nextState: anObject [
	nextState := anObject
]

{ #category : #notification }
GOLGameModel >> notifyEvolved [
		self announcer announce: GOLCellsEvolvedAnnouncement new
]

{ #category : #notification }
GOLGameModel >> notifyLastLife [
	self announcer announce: GOLLastLifeAnnouncement new
]

{ #category : #notification }
GOLGameModel >> notifyNextLife [
	self announcer announce: GOLNextLifeAnnouncement new
]

{ #category : #lifecycle }
GOLGameModel >> onLastLife [
	self notifyEvolved;
	notifyLastLife 
]

{ #category : #lifecycle }
GOLGameModel >> onNextLife [
	self notifyEvolved;
	notifyNextLife 
]

{ #category : #history }
GOLGameModel >> popLastStateFromHistory [
	"Recovers the last state stored in history if there is one, otherwise trows an error."

	| sapo |
	sapo := currentState content.
 currentState content: statesHistory removeLast.
	^ currentState
]

{ #category : #history }
GOLGameModel >> pushCurrentStateToHistory [
	"Stores the current state as the last element in the states history."

	| points |
	points := Set new.
	points addAll: self currentState content.
	self statesHistory add: points.
	^ self statesHistory
]

{ #category : #initialization }
GOLGameModel >> setCellStateAt: aPoint value: aValue [
	"Sets a cell state into the currentState sparse matrix"

	currentState setCellStateAt: aPoint value: aValue
]

{ #category : #accessing }
GOLGameModel >> statesHistory [
	^ statesHistory
]

{ #category : #accessing }
GOLGameModel >> statesHistory: anObject [
	statesHistory := anObject
]
