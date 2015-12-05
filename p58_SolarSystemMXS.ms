--Creating a Working Script 
/*
Before you create the user interface,you
must decide what you want the sript to do.
In this case, you will write a script that
does the following:

1.to start the solar system creation process, the user must create a sun.
The sun wil be a sphere created at[0,0,0].The user can set the sun's radius.

2.In 3ds Max 8, a new feture has been added the ability to handle right-click
user events for various buttons.To introduce this feature,you will make a 
different type of sphere depending on whether the user left-or right-clicks
on the create sun button.if the user left-clicks,a sphere is created.if the 
user right-clicks,a geosphere is created.

3.Once the sun is created, the user can create additional planets. the user
can choose the number of planets to create.

4.When the user presses the Create Planets button,planets wil be created,
each with a random radius.For each planet,a circle shape will be placed 
around the sun to represent the planet's orbit, and the planet will be 
constrained to that path with a Path constraint.

5.Once the planets are created, the user can select each planet and change
its radius and orbit path.Based on this information, you could create a user
interface like the one shown below.
*/

--Creating the User Interface 

--SolarSystem.ms 

if ((ssRoll != undefined) and (ssRoll.isdisplayed)) do (DestroyDialog ssRoll)


rollout ssRoll "Solar System"
(
	spinner spn_sunRadius "Sun Radius " range:[1,1000,50]
	button but_createSun "Create Sun"
	spinner spn_numPlanets "Number of Planets " type:#integer \
	range:[1,10,3] enabled:false 
	button but_createPlanets "Create Planets"  enabled:false 

	group "Planets"
	(
		pickbutton pbt_pickPlanet "Pick Planet" enabled:false autoDisplay:true 
		spinner spn_planetRadius "Planet Radius " enabled:false 
		spinner spn_orbitRadius "Orbit Radius " range:[0,1000,0] enabled:false 
	)

	on but_createSun pressed do 
	(
		spn_numPlanets.enabled = true 
		but_createPlanets.enabled = true 

		sun = sphere radius:spn_sunRadius.value
	)
	on but_createSun rightclick do 
	(
		spn_numPlanets.enabled = true 
		but_createPlanets.enabled = true 

		sun = GeoSphere radius:spn_sunRadius.value 
	)
	on but_createPlanets pressed do 
	(
		pbt_pickPlanet.enabled = true 
		spn_planetRadius.enabled = true 
		spn_orbitRadius.enabled = true 

		for i = 1 to spn_numPlanets.value do 
		(
			-- Create the planet 
			planet = sphere() 
			-- Set planet radius to a random number between 10 and 30
			planet.radius = random 10.0 30.0
			-- Create a circle for the planet's orbit 
			orbit = circle radius:(i*100)
			-- Put tje planet on a path 
			planet.pos.controller = Path_Constraint()
			planet.pos.controller.path = orbit 
			-- Rotate the path so its 0 position is random 
			orbit.rotation.z_rotation = random 0.0 360.0 
			orbit.rotation.y_rotation = random 0.0 180.0
			orbit.rotation.x_rotation = random 0.0 180.0
		)
	)

	local pPlanet 
	local pOrbit 

	on pbt_pickPlanet picked aPlanet do 
	(
		-- This sets the value of pPlanet to that of the chosen planet.
		pPlanet = aPlanet
		-- Put the picked planet's radius in the Planet Radius spinner 
		spn_planetRadius.value = aPlanet.radius 
		-- Put the orbit's radius in the Orbit Radius spinner 
		pOrbit = aPlanet.pos.controller.path 
		spn_orbitRadius.value = pOrbit.radius 
	)
	on spn_planetRadius changed value do 
	(
		pPlanet.radius = spn_planetRadius.value 
	)
	on spn_orbitRadius changed value do 
	(
		pOrbit.radius = spn_orbitRadius.value 
	)
)
CreateDialog ssRoll 200 200