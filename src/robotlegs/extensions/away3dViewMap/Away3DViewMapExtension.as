// ------------------------------------------------------------------------------
// Copyright (c) 2011 the original author or authors. All Rights Reserved.
//
// NOTICE: You are permitted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// ------------------------------------------------------------------------------
package robotlegs.extensions.away3dViewMap
{
	import away3d.containers.View3D;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;
	import robotlegs.extensions.away3dViewMap.api.IAway3DViewMap;
	import robotlegs.extensions.away3dViewMap.impl.Away3DViewMap;

	import org.hamcrest.object.instanceOf;



	/**
	 * Basic Away3DViewMap Extension.
	 * 
	 * @author jamieowen
	 */
	public class Away3DViewMapExtension implements IExtension
	{
		/*============================================================================*/
		/* Public Properties                                                         */
		/*============================================================================*/
		
		[Inject]
		public var mediatorMap : IMediatorMap;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		private var _uid : String = UID.create(Away3DViewMapExtension);
		private var _context : IContext;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/
		
		public function Away3DViewMapExtension()
		{
			
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/
		public function extend(context : IContext) : void
		{
			_context = context;
			_context.addConfigHandler(instanceOf(View3D), handleView3D);

			_context.injector.map(IAway3DViewMap).toSingleton(Away3DViewMap);
		}

		public function toString() : String
		{
			return _uid;
		}

		/*============================================================================*/
		/* Private Functions                                                           */
		/*============================================================================*/
		private function handleView3D(view3D : View3D) : void
		{
			_context.injector.map(View3D).toValue(view3D);

			// init the IAway3DViewMap now we have the reference to the View3D
			_context.injector.getInstance(IAway3DViewMap);
		}
	}
}
