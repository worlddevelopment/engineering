
Open Engineering
===
(not reinventing the wheel)
---
<img src="http://wiki.opensourceecology.de/skins/common/images/wiki.png" alt="open source & ecology" title="" align="left" /> 
<img src="https://www.libreoffice.org/themes/libreofficenew/img/logo.png" alt="libreoffice & visual basic" title="" style="background-color:rgb(0,165,0)" /> 

Why Libre Office?
===

Libre Office is open source and free.
Readily available.

Easy to use. (compared to other good alternatives like Octave)

Its file format is XML, human readable and Git capable, making light-weight version control and merging of improvements by other green people of this world possible.

It features easy and structured calculation possibilities. (Cells can be coloured.)

Cells can be analysed in graphs directly in Liberty Office.

It allows for programming directly on the data using (Visual) Basic language.

This makes it possible to integrate numerical or analytical algorithms that are essential in many parts of engineering.
 
Integration with Blender, FreeCAD and OpenFOAM is easily possible via export and import plugins (written in Basic in Libre Office and in Python in blender and FreeCAD, creating OpenFOAM compatible exports is just a matter of maths).

<img src="http://www.freecadweb.org/images/freecad.png" alt="freecad" title="" align="left" /> 
<img src="http://www.openfoam.org/img/OpenFOAMlogo3.png" alt="openfoam" title="" align="" /> 

Goals
===

A greener and healthy planet (for both animals, fungi and plants). The ecological impact will always be eyed with.

Biology, technology and Geology are important factors of this undertaking.

We want a green, life-quarrel minimizing project, for a better world.

Organisation-like structures will be rejected. Development is not only open, it also has no hierarchies. Good arguments and dialogue will prevail.

The availability for free and open source/access of high living standards might reduce poverty and stress in this world. Potentially reducing the readiness for taking an active or passive part in terrorist actions.


Concerns due to misuse?
===

Everything can be misused. Even closed-source information can be hacked by terrorists if they really wanted to (and perhaps they want, and then the effect'd be only negative - and noone even'd know they had the technology).

Furthermore as the main purpose of this engineering is ecological appliances, the danger of misuse is reduced as no easy instructions or preset calculations exist for e.g. building dangerous things.

Instead, to know how to create own power and have proper design (calculations) and instructions available as Open source, may even prevent terrorists from doing harmful things to acquire access to other power sources. They'll get their power sources (by force) if they want anyway.

Thus it may even be less harm done if they can construct their own power plants instead of getting their power by force.

=> Therefore an open engineering resource like this may do more good than it can be misused. Of course misuse is possible, but cornerstones will be surrected and without much knowledge circumventing the effects of these cornerstones will be difficult.

How to contribute/use?
===

A open source/free Linux operating system is recommended.

Then you can use the shell script ./.git.sh for automatic assembly/packing and unpacking of the office document:

    # 1a Clone the repository onto your local system:
    git clone https://github.com/worlddevelopment/engineering.git
    # OR
    # 1b (using SSH, which is quicker)
    git clone git@github.com:worlddevelopment/engineering.git

    # 2 Update the files and pack the document:
    ./git.sh pull

    # 3.1 Check if other files have been modified:
    git status
    # 3.2a Choose which (modified/new) files shall be committed (DON'T ADD/COMMIT THE engineering.ods BINARY DOCUMENT):
    git add <modified or new file pattern>

    # OR
    # 3.2b To unpack and add all the XML files of the engineering.ods document, there is a command that automates the unpacking and adding of the files to be committed:
    ./git.sh add

    # 3 Prevent merge or resolve conflicts:
    # Look for changes in the repository and check for conflicts.
    git pull #<-- Attention: Better not use ./git.sh pull here (it would move your currently open `engineering.ods` libreoffice file to `.engineering.ods.bak` and generate a new file `engineering.ods`. It is recommended to close the document in libreoffice first (or to reload it)!
    # If there have been conflicts reported by git pull, then resolve these first. Consult other contributors to see find a solution (if it's not obvious or you are confident you know how to merge it manually without breaking the XML/document).

    # 4 Commit your additions/improvements/merge:
    git commit -m "Add calculations for power generation of boiling tank ontop a candlelight."

    # 5 Send the commits to the server:
    git push
    

