package net.fproject
{
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	
	import net.fproject.core.AppContext;
	import net.fproject.di.Implementation;
	import net.fproject.di.ImplementationConfig;
	import net.fproject.di.InstanceFactory;
	import net.fproject.event.AppContextEvent;
	import net.fproject.rpc.RemoteObjectFactory;
	import net.fproject.service.IAppContextService;
	
	import org.flexunit.async.Async;

	public class ServiceTestCaseBase
	{
		[Before(async)]
		public function runBeforeEveryTest():void
		{
//			if (ImplementationConfig.instance.impls == null)
//				ImplementationConfig.instance.impls = [];
			//ImplementationConfig.instance.impls.push(new Implementation(IAppContextService, WebAppContextService));
			
			/*RemoteObjectFactory.setServerConfig(<ServerConfig>
                <DefaultDestination>projectkitamf</DefaultDestination>
				<RemoteObject><Name>IssueService</Name><Destination>pk-http</Destination></RemoteObject>
			</ServerConfig>);*/
			
			//Authenticate credentials
			/*if (!AppContext(InstanceFactory.getInstance(AppContext)).authenticated)
			{				
				var resp:CallResponder = AppContext(InstanceFactory.getInstance(AppContext)).login("admin", "admin");
				if(resp)
				{
					//Async.proceedOnEvent(this, resp, ResultEvent.RESULT, 10000 );
					Async.proceedOnEvent(this, AppContext(InstanceFactory.getInstance(AppContext)), AppContextEvent.LOADED, 5000);
					Async.registerFailureEvent(this, resp, FaultEvent.FAULT);
				}				
			}*/
			
			//Your test data initialization
		}
	}
}