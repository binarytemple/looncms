package uk.mafu.flex.builders.display
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IViewCursor;
	import mx.containers.HBox;
	import mx.controls.ComboBox;
	import mx.controls.Label;
	import mx.core.UIComponent;
	
	import org.swizframework.Swiz;
	
	import uk.mafu.flex.meta.ROW;
	import uk.mafu.flex.util.Util;
	import uk.mafu.loon.events.EntityModifiedEvent;

	public class EnumWidget extends HBox
	{
		private var parentEntity:Object;
		private var dropdown:ComboBox;
		
		public function EnumWidget(entity:Object,metaRow:ROW,parentContainer:UIComponent){
			super();
			parentContainer.addChild(this);
			//Add a resize to 100% event listener first....
			this.parent.addEventListener(Event.RESIZE,function():void{
				if(parent != null){
					width = parent.width ;
				} 
			});
			if(entity[metaRow.name]==null){
				entity[metaRow.name] = metaRow.defaultValue;
			}
			
			this.data = entity[metaRow.name];
			
			var textLabel:Label = new Label();
			textLabel.percentWidth = 30; 
			textLabel.height = 20 ;
			textLabel.truncateToFit = true;
			textLabel.text = metaRow.label;
			addChild(textLabel);

			dropdown = new ComboBox();
			dropdown.dataProvider = metaRow.enums;
			setSelected();
			addChild(dropdown);
			
//			//Bind from widget to the data
//			BindingUtils.bindProperty(textArea, "text",data, metaRow.name);
//			//Bind from data to the widget
//			BindingUtils.bindProperty(data, metaRow.name ,textArea, "text");
			dropdown.addEventListener(Event.CHANGE,function (evt:Event):void{
				Util.debug("dropdown.event.change data = " + data + "'");
				var selected:Object = dropdown.dataProvider[dropdown.selectedIndex];
				entity[metaRow.name] = selected;
				Swiz.dispatchEvent(new EntityModifiedEvent(entity));
			});
			
//			addEventListener(Event.RESIZE,
//			function ():void {
//				label.width = (width * 0.3);
//				textArea.width = (width * 0.5);
//				textArea.percentWidth
//			},false,0,true);
		}
		
		private function getItemIndex(o:Object):Number {
			var ret:Number = (dropdown.dataProvider as ArrayCollection).getItemIndex(o);
			return ret;
		}
		
		private function setSelected():void {
			var cursor:IViewCursor = (dropdown.dataProvider as ArrayCollection).createCursor();	
			while (!cursor.afterLast){
				if(this.data !=null && cursor.current == data) {
					dropdown.selectedIndex = getItemIndex(cursor.current);
					return;
				}
				//Set the empty option as selected.
				if(this.data ==null ) {
					dropdown.selectedIndex = 
						getItemIndex((dropdown.dataProvider as ArrayCollection).getItemAt(0));
					return;
				}
				cursor.moveNext();
			}
			//If nothing is selected, set selected index to -1( try to get an empty cell).
			dropdown.selectedIndex = -1;
			Util.debug("finished setting the selected item");
		} 
	}
}