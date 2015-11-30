-- MyPileUp.ms 
--Script for piling up Primitives that \
--have a height parameter 

/*
The script will operate on objects already in the scene,
so the first thing you need to do is make a collection
of these objects.
*/
coll = $* -- put all objects in a collection named coll 

--get the denominator for the fraction, which is equal to the \
--number of objects in the scene minus one.
bottomFraction = coll.count - 1.0

/*
before creating a loop to go through the objects,
you need a variable to hold the Z position for
the next object in the loop.
The Z position for the first objext is 0,so set
this variable to 0.
Add the following line to the script:
*/
zNextobject = 0 --Variable to hold the next z position 

--create a loop that piles up the objects.
for i = 1 to coll.count do  
(
	coll[i].pos = [0,0,zNextobject] --sets the z position for the object 
	zNextobject += coll[i].height --Adds the objext's height
	topFraction = i - 1
	greenValue = (topFraction / bottomFraction) * 255
	coll[i].wirecolor = [255, greenValue, 0]
)

