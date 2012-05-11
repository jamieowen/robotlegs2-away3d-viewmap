package mediators
{
	import robotlegs.extensions.away3dViewMap.api.IAway3DMediator;

	/**
	 * @author jamieowen
	 */
	public class Away3DSubViewMediator implements IAway3DMediator
	{
		public function Away3DSubViewMediator()
		{
			
		}

		public function set away3d_viewComponent(view:*):void
		{
			trace( "away3d view comp : " + view + " " + this );
		}

		public function away3d_initialize():void
		{
			trace( "away3d initialise : " + this );
		}

		public function away3d_destroy():void
		{
			trace( "away3d destroy " + this );
		}
	}
}
