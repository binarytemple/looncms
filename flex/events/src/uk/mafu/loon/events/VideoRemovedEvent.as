package uk.mafu.loon.events
{
	import flash.events.Event;
	
	import uk.mafu.flex.util.Assert;
	import uk.mafu.flex.util.Util;
	
	/**
	 * Dispatched when we wish for an entity to be deleted.
	 */
	public class VideoRemovedEvent extends Event
	{
		public var pk:Object;
		public static const NAME:String = Util.getFullClassName(VideoRemovedEvent);
		
		public function VideoRemovedEvent(pk:Object) {
        	super(NAME, true,true);
        	this.pk = pk;
        	Assert.notNull(pk);
        	Util.debug("created new:" + Util.getClassname(this) );
        }

    	/**
     	*  @private
     	*/
    	override public function clone():Event{
       		return Util.cloneObject(this) as Event;
    	}
	}
}