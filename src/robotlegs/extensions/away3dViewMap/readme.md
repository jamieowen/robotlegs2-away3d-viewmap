# Away3D ViewMap

A Robotlegs2 extension to enable mapping IMediator's to Away3d ObjectContainer3D's

## Kept simple
This an absolute bare minimum approach to mapping Away3D ObjectContainer3D/Scene3D to the RL2 Mediator Map.

It adds a configHandler to the context to handle a single View3D instance.

When a View3D instance is added, the View3D scene is listened to for Scene3DEvent ADDED/REMOVED events.

When a ObjectContainer3D is added or removed it calls MediatorMap.mediate() 
or MediatorMap.unmediate() respectively.

## Notes.
There is no eventMap, addViewListener(), addContextListener() yet.





