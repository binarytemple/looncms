package uk.mafu.loon.config.epr
{
	import uk.mafu.loon.AbstractConfiguration;
	
	public class RemoteConfiguration extends AbstractConfiguration
	{
		public override function getRootContext():String {
			return "http://mafunet2010.amp-london.com/epr-server-0.0.1-SNAPSHOT";
		}
	}
}