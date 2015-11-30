b = Sphere radius:20
showProperties b 
show b 
b.segs = 30
b.wirecolor = red



fn ChangeToRed obj =
(
	if superClassOf obj == GeometryClass then 
	(
		obj.wirecolor = [255, 0, 0]
	)
)

for i = 1 to 3 do 
(
	sphere pos:[random -80 80, random -80 80, random -80 80]
	cone pos:[random -80 80, random -80 80, random -80 80]
	Cylinder pos:[random -80 80, random -80 80,random -80 80]

)


for obj in objects do 
(
	ChangeToRed obj 
)

ChangeToRed $Sphere002

fn putUpMessage text1:"File Not found." = 
(
	messageBox text1 title:"Warning" beep:true
)

s = sphere()
msg1 = "The sphere's radius is "
msg2 = s.radius as string 
putUpMessage text1:(msg1 + msg2)

m = 30.4
n = 23.0
fn addnums2 x y = 
(
	x = 10.0
	x + y 
)

addnums2 m n 

s.segs = 36

fn foo = 
(
	g = 4 
	h = 5
	return g*h 
)

i = foo()

show b


