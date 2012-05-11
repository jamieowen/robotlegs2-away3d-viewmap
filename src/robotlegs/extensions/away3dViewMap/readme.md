# Away3D ViewMap

A Robotlegs2 extension to enable Away3DViews in Robotlegs2.

## Keep Simple.
This an absolute bare minimum approach to mapping Away3D ObjectContainer3D/Scene3D to the RL2 Mediator Map.

It adds a configHandler to the context to handle a single View3D instance.

When a View3D instance is added, the View3D scene is listened to for Scene3DEvent ADD/REMOVE events.

When a ObjectContainer3D is added or removed it calls MediatorMap.mediate() 
or MediatorMap.unmediate() respectively.

One bottleneck is the RL2 DefaultMediatorManager class.  Which casts views to flash.display.DisplayObject in the intializeMediator(view) method. This means that views are passed to the Mediator as null even though the IMediator interface is typed as an Object.

The solution was to introduce a IAway3DMediator interface and manage the set viewComponent / initialise() / destroy() methods manually.  The standard initialise()/ destroy() methods are called by the DefaultManagerMediator but we ignore them.

Without the DefaultMediatorManager casting you would be able to use the default RL2 IMediator class as usual.

## Notes.
There is no Mediator.addViewListener() or Mediator.addContextListener() yet.
You'll have to inject those dependencies to the Mediator manually.

A Warning is thrown from SwiftSuspenders saying we already have a DisplayObjectContainer mapped.  This will likely be from the Away3D View3D object as it extends flash.display.Sprite.  (which passed as a configuration to the RL2 Context)





