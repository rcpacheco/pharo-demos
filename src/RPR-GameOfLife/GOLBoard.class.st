Class {
	#name : #GOLBoard,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLBoard >> defaultHeight [ 
^ 400
]

{ #category : #accessing }
GOLBoard >> defaultWidth [ 
^600
]

{ #category : #initialization }
GOLBoard >> initialize [
	super initialize.
	self
		background: Color gray;
		constraintsDo: [ :c | 
			c horizontal exact: self defaultWidth.
			c vertical exact: self defaultHeight ]
]
