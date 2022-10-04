--[[
 __          __        _     _   __  __            _                 
 \ \        / /       | |   | | |  \/  |          | |                
  \ \  /\  / /__  _ __| | __| | | \  / | __ _ _ __| | _____ _ __ ___ 
   \ \/  \/ / _ \| '__| |/ _` | | |\/| |/ _` | '__| |/ / _ \ '__/ __|
    \  /\  / (_) | |  | | (_| | | |  | | (_| | |  |   <  __/ |  \__ \
     \/  \/ \___/|_|  |_|\__,_| |_|  |_|\__,_|_|  |_|\_\___|_|  |___/
---------------------------------------------------------------------

The World Markers component will give you the ability to add markers in the world that show to the
player a point of interest in the world. For example, a Blacksmith icon will display in the UI that
the player can see to determine which way to go to get to the Blacksmith.

This component is useful to help guide players around the game.

----------------------------------------------------------------------------------------------------

==========
How to use
==========

Add the World Markers template to the hierarchy. The template comes with 2 examples created to show
you how easy it is to creake a marker.

The compoment also supports removing and adding markers as runtime. This is useful for removing a 
marker that the player has visited. Or adding a new marker for a quest.

To add and remove markers, broadcast to either the `Marker.Add or `Marker.Remove` events, and pass
the key that you wish to lookup and add or remove.

A data table called `World Markers` is where all of the markers need to go. The first column is the
unqiue key for that markert. The icon is the icon to spawn in for that markert. The target is the 
target object in the world the marker icon should point to.

There are a couple of custom properties on the root of the template.

- EdgeOffset

Distance the icon is from the edge of the screen.

- WorldOffset

Distance about the target.

--]]
