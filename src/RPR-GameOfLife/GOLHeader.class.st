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
		background: Color orange;
		layout:
			(BlGridLayout new
				columnCount: 5;
				rowCount: 1;
				cellSpacing: 6;
				alignMargins);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: self defaultHeight.
			c frame vertical alignTop ]
]
