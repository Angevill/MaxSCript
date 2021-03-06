-- MyPileUp.ms 
--Script for piling up Primitives that \
--have a height parameter 

/*
The script will operate on objects already in the scene,
so the first thing you need to do is make a collection
of these objects.
*/
--coll = $* -- put all objects in a collection named coll 

--get the denominator for the fraction, which is equal to the \
--number of objects in the scene minus one.
bottomFraction = objects.count - 1.0

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
for i = 1 to objects.count do  
(
	objects[i].pos = [0,0,zNextobject] --sets the z position for the object 
	zNextobject += objects[i].height --Adds the objext's height
	topFraction = i - 1
	greenValue = (topFraction / bottomFraction) * 255
	objects[i].wirecolor = [255, greenValue, 0]
)

/*
This is a collection of all objects in the scene that is
automatically generated by 3ds Max.Instead of creating the
array coll and using it to control the for loop, you replace
the for loop line with the following.

previous:
for i = 1 to coll.count do

changed:
for i = 1 to objects.count do
*/