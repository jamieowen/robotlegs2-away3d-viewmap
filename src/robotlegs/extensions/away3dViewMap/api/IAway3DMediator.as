package robotlegs.extensions.away3dViewMap.api
{

	/**
	 * 
	 * A custom Away3D Mediator interface to solve the problems with current RL2 Mediator and DisplayObject.
	 * 
	 * Note : We cannot keep the standard set viewComponent, initialise(), destroy() method names as the RL2 DefaultMediatorManager calls them anyway. ( e.g. through mediator.hasOwnProperty("viewComponent") )
	 * 
	 * @author jamieowen
	 */
	public interface IAway3DMediator
	{
		function set away3d_viewComponent(view : *) : void;

		function away3d_initialize() : void;

		function away3d_destroy() : void;
	}
}
