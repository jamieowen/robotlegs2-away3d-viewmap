package mediators {
	import flash.utils.setTimeout;
	import views.Away3DSubView;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.lights.PointLight;
	import away3d.containers.Scene3D;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.CubeGeometry;
	import away3d.entities.Mesh;
	import robotlegs.extensions.away3dViewMap.api.IAway3DMediator;

	/**
	 * @author jamieowen
	 */
	public class Away3DScene3DMediator implements IAway3DMediator
	{
		private var _scene:Scene3D;
		
		public function get scene():Scene3D
		{
			return _scene;
		}
		
		public function Away3DScene3DMediator()
		{
			
		}
		
		public function set away3d_viewComponent(view:*):void
		{
			trace( "away3d view comp : " + view + " " + this );
			_scene = view as Scene3D;
		}

		public function away3d_initialize():void
		{
			trace( "away3d initialise : " + this );
			
			// add some objects 
			var light:PointLight = new PointLight();
			light.ambient = .4;
			light.ambientColor = 0xAAAAAA;
			light.moveTo(1500, 700, -700);
			
			var picker:StaticLightPicker = new StaticLightPicker([light]);
			
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			material.lightPicker = picker;
			
			var cube:Mesh = new Mesh( new CubeGeometry(), material );
						
			scene.addChild( light );			
			scene.addChild( cube );
			
			// add a sub view that should trigger a new mediator
			var subView:Away3DSubView = new Away3DSubView();
			scene.addChild( subView );
			
			// remove it...
			setTimeout( function():void{
					scene.removeChild(subView);
				}, 3000);
				
		}

		public function away3d_destroy():void
		{
			trace( "away3d destroy " + this );
		}
	}
}
