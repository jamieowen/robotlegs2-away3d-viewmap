package mediators
{
	import away3d.containers.Scene3D;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.CubeGeometry;

	import robotlegs.bender.extensions.mediatorMap.api.IMediator;

	import views.Away3DSubView;

	import flash.utils.setTimeout;

	/**
	 * @author jamieowen
	 */
	public class Away3DScene3DMediator implements IMediator
	{
		private var _scene:Scene3D;
		
		public function get scene():Scene3D
		{
			return _scene;
		}
		
		public function Away3DScene3DMediator()
		{
			
		}
		
		public function set viewComponent(view:Object):void
		{
			trace( "rl2 standard set : " + view );
			_scene = view as Scene3D;
		}

		public function initialize():void
		{
			trace( "rl2 standard init " + this );
			
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

		public function destroy():void
		{
			trace( "rl2 standard destroy " + this );
		}
	}
}
