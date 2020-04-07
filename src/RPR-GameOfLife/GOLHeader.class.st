Class {
	#name : #GOLHeader,
	#superclass : #BlElement,
	#category : #'RPR-GameOfLife'
}

{ #category : #accessing }
GOLHeader >> defaultHeight [ 
^ 40
]

{ #category : #initialization }
GOLHeader >> initialize [
	super initialize.
	self
		background: Color veryDarkGray;
		layout:
			(BlGridLayout new
				columnCount: 4;
				rowCount: 1;
				cellSpacing: 10;
				alignMargins);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: self defaultHeight.
			c frame vertical alignTop ]
]
