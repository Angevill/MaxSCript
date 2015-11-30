-- MyPileUp.ms 
--Script for piling up Primitives that \
--have a height parameter 

/*
The script will operate on objects already in the scene,
so the first thing you need to do is make a collection
of these objects.
*/
coll = $* -- put all objects in a collection named coll 

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
for i in coll do 
(
	i.pos = [0,0,zNextobject] --sets the z position for the object 
	zNextobject += i.height --Adds the objext's height
)

s = sphere()