s = sphere()
for i = 1 to 5 do 
(
	a = instance s pos:[i*50, 0, 0]
	if (s.pos.x > 150) then 
	(
		s.pos.y = 50
		c = (30 + i)
	)
	b = c -- The variable c is undefined in this block.
	b = copy a --The variable a is defined within this same block,
	 -- so it is valid.
)

if s.pos.x == 10 then s.radius = 40

if s.radius != 10 then messageBox "Radius is not 10."

b = box()
if b.pos.x == 0 then b.height = 40
else b.height = 10
messageBox "Done"

for i = 1 to 5 do sphere pos:[i*50, 0, 0]

for obj in geometry do 
(
	if obj.pos.x <= 150
	then obj.segs = 16
	else obj.radius = 30
)

intArray = #()
for i = 1 to 5 do append intArray (i*5)
for i in intArray do sphere pos:[i, i*2, i*3]

for i = 1 to 5 do 
(
	a = sphere pos:[i*50, 0, 0]
	messageBox a.name
)

cylArray = #()
for i = -3 to 3 do 
(
	if i != 0 then 
	(
		a = Cylinder height:50 pos:[i*40, 0, 0]
		append cylArray a 
	)
	else 
	(
		a = cone height:50 pos:[i*40, 0, 0]
		messageBox a.name 
	)
)


--do while 
i = 0
t 
do 
(
	t = Teapot pos:[i*20, 0, i*20]
	i = i + 1
)while t.pos.x < 1001


--while do 
i = 0
test = true
while test do 
(
	t = teapot pos:[i*30, 0, i*30]
	i += 1
	test = t.pos.x < 101
)

$Teapot002.segs = 6

myArray = #(1,2,4,8,16)
myArray[3] 
myArray[2] = 50
append myArray 56
show myArray


--To store objects in an array 
c = Cylinder pos:[50,0,0]
b = box()
s = Sphere pos:[-50,0,0]

objectArray = #(c,b,s)

d = Donut()
append objectArray d 

--Array Functions 
a = #("one", "word", "at", "a", "time")
for i = 1 to a.count do 
(
	messageBox a[i]
)
print a 
print a[2]

--deleteItem 
arr = #(1.0, 0.55, .3, 2.6)
deleteItem arr 2
for i = 1 to arr.count do 
messageBox (arr[i] as String)

--join 
for i = 1 to 3 do 
(
	Sphere()
	box()
)
arr = $sphere* as Array
join arr $box*
for i = 1 to arr.count do 
messageBox arr[i].name 

--findItem
arr = #(2.4, 4, 3.2, 1.1)
index = findItem arr 3.2
--the found index will be 3
messageBox (index as string)
--3.3 is not in the array, 
--so the returned index is 0
index = findItem arr 3.3
messageBox (index as string) 

--sort 
sort arr 

--first create an empty array 
arr = #()
--now add some elements 
arr[1] = 4 
arr[2] = "string stuff"

--Print Arrays 
options.PrintAllElements = false
h = for i = 1 to 30 collect i 


-- true 
options.printAllElements = true 
h 

--Multidimensional Arrays 
h = #(#(1,2),#(3,4))

fn array2D row column = 
(
	local data = #()
	for i = 1 to column do 
	(
		data[i] = #(0)
		for j = 1 to row do 
		(
			data[i][j] = random 1 10
		)
	)
	return data 
)
myArray = array2D 2 4
myarray = array2D 3 6

test = #()
test[1] = #(0)
test[1][1] = random 1 10

print test 

test[2] = #(0)

print myArray


--to use multidimensional array with 
--mixed data types:
cylobj1 = #()
cylobj2 = #()

--create some modifiers to use later:
tap = taper amount:-1.0
bnd = bend angle:30

--fill in array elements for the \
--Cylinder objects.
cylobj1[1] = 30
cylobj1[2] = 0.0
cylobj1[3] = "first Cylinder"
cylobj1[4] = tap 
/*you define the first element to be 
the Cylinder height,the second its x
position,the third to be the cylinder's
name,and the fourth to be the modifier
you are applying.
*/
cylobj2[1] = 60.0
cylobj2[2] = 40.0
cylobj2[3] = "second Cylinder"
cylobj2[4] = bnd 

--build an array of Cylinder description arrays.
my_cylinders = #(cylobj1, cylobj2)

/*to access an element from cylinders,
you use cylinders[i][j],when the first
index[i] refers to the cylinder description
array,and the second index[j] indexes 
into the cylinder description array.
*/

--build the two cylinders 

for i = 1 to my_cylinders.count do 
(
	c = Cylinder height:my_cylinders[i][1] \
				 pos:[my_cylinders[i][2],0.0,0.0] \
				 name:my_cylinders[i][3] \
				 heightsegs:10
addModifier c my_cylinders[i][4]
)


--WILDCARDS--

--to use collections versus arrays:

coll = $Teapot*
arr = coll as Array

for i = 1 to arr.count do 
(
	if not isDeleted arr[i] then 
	messageBox arr[i].name 
)

$.name 


--Structrue Syntax 

struct Person 
(
	name,
	age,
	height,
	weight
)

--assign values to the member variables in the \
--structure definition itself.
struct Person 
(
	name = "Carol",
	age = 47,
	height = 68,
	weight = 130
)

myPerson = Person()

print myPerson

myPerson = Person "Carol" 47 68 130

myPerson.name 

myPerson.name = "sue"

print myPerson

--Structure Member Functions 

/*
Structures can be made very powerful bu including \
member functions into a structure definition.
*/
struct PersonCM
(
	name, 
	age, 
	height,
	weight, 
	fn GetHeightCM = 
	(
		cmheight = height * 2.54
	)
)

myPersonCM = PersonCM "Sue" height:60
myPersonCM.GetHeightCM()


--Calling Functions During Construction of \
--a Structure(Advances Topic)

struct Person 
(
	name,
	age,
	height,
	weight,
	fn GetHeightCM = 
	(
		height * 2.54
	),
	fn GetWeightKG =
	(
		weight * 2.2
	),
	cmHeight = GetHeightCM(),
	kgWeight = GetWeightKG()
)

myPerson = Person "Carol" height:60 weight:130

myPerson.cmHeight 
myPerson.kgweight 

--Strings

--Concatenation--

text1 = "MAXScript is "
text2 = "fun!"
text3 = text1 + text2 
messageBox text3 

--Findstring 

test = "String example"
location = findString test "ex"

--Replace--

test = "This is a string"
test2 = "yet another"
test3 = replace test 9 1 test2 
messageBox test3 

--Converting Between Numbers and Strings 

string1 = "Your customer number is 345"

custNum = 345 -- custNum is an integer 
custString = custNum as string -- makes a string from custNum
string2 = "Your customer code is " + custString

print string2 

--To use string/numeric conversions:

s = sphere()
val = s.radius as string 
text1 = "The sphere's radius is "
text2 = text1 + val 
messageBox text2 

val2 = "20.0"
s2 = Sphere()
s2.radius = val2 as float  