Class {
	#name : #GOLModelExamples,
	#superclass : #Object,
	#category : #'RPR-GameOfLife'
}

{ #category : #'instace creation' }
GOLModelExamples >> defaultModel [
	"Generates a model with the default dimentions and conditions"

	<gtExample>
	^ GOLGameModel new
]

{ #category : #'instace creation' }
GOLModelExamples >> mediumModel [
	"Generates a model with mid size dimentions"
	<gtExample>
	^ GOLGameModel rows: 300 columns: 600
]

{ #category : #'instace creation' }
GOLModelExamples >> smallModel [
	"Generates a model with small size dimentions"
	<gtExample>
	^ GOLGameModel rows: 150 columns: 200
]
