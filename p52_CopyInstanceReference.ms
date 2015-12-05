--Copy 

--to copy an object 

b = box heightsegs:8 
c = copy b 
move c [25,0,0]

d = copy c pos:[50,0,0]

--Instance 

--To instance an object:

i = instance b pos:[0,25,0]

addModifier i (bend angle:60 direction:90)

deleteModifier i 1

--Reference 

--To reference an object:

r = reference b pos:[0,-25,0]

addModifier r (bend angle:90)

b.height = 40.0


--Cloning Nodes Using MaxOps.CloneNodes

--To demonstrate the difference between using the 
--normal copy method versus the maxOps.CloneNodes
--method:

a = $
c = copy a pos:[0,25,0]

maxOps.CloneNodes a actualNodeList:&ANL clonetype:#copy \
offset:[-25,-25,0] newNodes:&NN 

print ANL 
print NN 

maxops.CloneNodes a offset:[50,50,0] newNodes:&NN2 

maxOps.CloneNodes a offset:[-50,-50,0] 

select ANL 

-- Copy Arrays 

h = #(1,2,3)
m = copy h #nomap 
max ?


--Command Panels 

--To Set a Command Panel 

SetCommandPanelTaskMode #modify 
GetCommandPanelTaskMode ()

max create mode 
max modify mode 
max display mode 
max hierarchy mode 
max motion mode 
max Utility mode 

--Main tool bar 

--Picking Scene Objects 

--To use the pickobject Function

fn mySphereFilter obj = ( Classof obj == Sphere )
sel = pickObject message:"Pick any sphere" filter:mySphereFilter
format "You selected： % \n" sel.name 


--Picking Points 

--To use the pickPoint Function

pnt = point3 0 0 0
for i = 1 to 3 do 
(
	pnt = pickPoint snap:#3d rubberband:pnt 
)