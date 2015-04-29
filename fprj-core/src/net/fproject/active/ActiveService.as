///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.active
{
	import mx.rpc.CallResponder;
	
	import net.fproject.service.ServiceBase;
	
	/**
	 * <p>ActiveService implements a common set of operations for supporting remote access 
	 * to RESTful or AMF service.</p>
	 *
	 * <p>In case of working with JSON, the service uses a model class to deserialize/serialize
	 * data when sending/receieving remote message. The model class should be specified via 
	 * <code>modelClass</code> getter, which must have the following singature:</p>
	 * <pre>public function get modelClass():Class</pre>
	 * 
	 * <p>By default, the following operations are supported:</p>
	 * <ul>
	 * <li><code>findOne</code>: Return the details of a model by primary keys (ID)</li>
	 * <li><code>find</code> Find a list of models by searching condition and pagination information</li>
	 * <li><code>save</code> Insert a new model or update an existing model if the ID fields are specified</li>
	 * <li><code>remove</code> Delete an existing model by primary keys (ID)</li>
	 * <li><code>batchSave</code> Batch-save an array of models</li>
	 * <li><code>batchRemove</code> Batch-remove a list of models by specifying a list of IDs</li>
	 * </ul>
	 *
	 * <p>
	 * To modify existing operation or add a new one, either override existing operation method or 
	 * write a new operation method and specify appropriate information in [RESTOperation] metadata.</p>
	 * Example:
	 * <pre>
	 * [RESTOperation(method='GET',returning='User[]')]
	 * public function findAll(completeCallback:Function=null, failCallback:Function=null):CallResponder
	 * {
	 * 	return createServiceCall(remoteObject.findAll(),
	 * 		completeCallback, failCallback);
	 * }</pre>
	 * 
	 *
	 * @author Bui Sy Nguyen
	 */
	public class ActiveService extends ServiceBase
	{		
		/**
		 * <p>Only used in RESTful service, this is the class used to serialize/deserialize 
		 * JSON data.</p>
		 * <p>This model class also can be specified by class metadata, for example:</p>
		 * <pre>
		 * [RemoteObject(modelClass="net.fproject.model.User")]
		 * public class UserService extends ActiveService</pre>
		 * <p>In the case of the extends class doesn't override the getter <code>modelClass</code>,
		 * the service will find the model class in current application domain by the name of the
		 * service class itself without suffix <code>'Service'</code>.
		 * For example, the service with name <code>'UserService'</code>
		 * will use a model class with name <code>'User'</code> if it exists.</code></p>
		 */
		public var modelClass:Class
		
		[RESTOperation(method='GET', route="/{0}", returning="{modelClass}", extraParams="{1}")]
		/**
		 * Returns a single model instance by a primary key or a compsite value of primary key.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a single customer whose primary key value is 10
		 * customer = customerService.findOne("10");
		 * 
		 * // find a single customer whose composite primary key value is "11,20"
		 * customer = customerService.findOne("11,20");</pre>
		 *
		 * @param id primary key value or a composite value of primary key 
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * @param extraParams An optional list of extra URL parameters used for service call.
		 * For example you can pass <code>"expand=profile"</code> to make the additional URL parameter <code>&expand=profile</code>
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be a model instance 
		 * matching the condition, or null if nothing matches.
		 */
		public function findOne(id:Object,
								completeCallback:Function=null, failCallback:Function=null,
								...extraParams):CallResponder
		{
			return createServiceCall(remoteObject.findOne(id, extraParams),
				completeCallback, failCallback);
		}
		
		[RESTOperation(method='GET', route="?criteria={0}&page={1}&per-page={2}&sort={3}", returning="{modelClass}[]", extraParams="{4}")]
		/**
		 * Finds models by a filter condition and returns a set of model instances with pagination.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a all customers whose name is like "ABC" and age equals to 25
		 * customer = customerService.find({condition:"name LIKE :name AND age=:age",params:{":name":"%ABC%",":age":25}});
		 * 
		 * // find a all customers whose name is like "ABC", paging with 10 records per page and
		 * // seek to page #2
		 * customer = customerService.find({condition:"name LIKE :name",params:{":name":"%ABC"}}, page:2, perPage:10);</pre>
		 *
		 * @param criteria the criteria contains searching condition and params to bind
		 * @param page the page to load, the first page is 1, second is 2 and so on...
		 * @param page the page-size of pagination. If this value is less than 0, the default page size is used.
		 * @param sort the sort parameter. For example: <code>'userName,-birthDay'</code> 
		 * will sort by <code>userName</code> as ASC and <code>birthDay</code> as DESC
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * @param extraParams An optional list of extra URL parameters used for service call.
		 * For example you can pass <code>"expand=profile"</code> to make the additional URL parameter <code>&expand=profile</code>
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be an array of model instances
		 * matching the condition, or null if nothing matches.
		 */
		public function find(criteria:Object=null, page:Number=NaN, perPage:Number=NaN, sort:String=null,
							 completeCallback:Function=null, failCallback:Function=null,
							 ...extraParams):CallResponder
		{
			return createServiceCall(remoteObject.find(criteria, page, perPage, sort, extraParams),
				completeCallback, failCallback);
		}
		
		[RESTOperation(method='POST', route="/save?fields={1}")]
		/**
		 * <p>
		 * Save a model object
		 * The model is inserted as a row into the database table if its primary key field
		 * is null (usually the case when the model is created using the <code>new</code>
		 * operator). Otherwise, it will be used to update the corresponding row in the table
		 * (usually the case if the model is obtained using one of those <code>find</code> methods.)
		 * </p><p>
		 * If the record is saved via insertion, and if its primary key is auto-incremental,
		 * the primary key will be returned and passed to <code>completeCallback</code> function.
		 * 
		 * @param model the model to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @param attributes a list of attributes that need to be saved.
		 * If this parameter is <code>null</code>, all attributes that are loaded from DB excepts
		 * for relations, will be saved.
		 *
		 * <p>If value of first element of this array equals to '&#42;', then all attributes of the model
		 * that are not relation-attribute will be saved, and all attributes from the
		 * second element will be considered as relation names to be saved.
		 * For example:<pre>userService.save(model, ['&#42;', 'userProfile', 'resources'])</pre>
		 * </p>
		 *
		 * <p>If value of first element does not equal to '&#42;', then all attributes in the list
		 * will be saved regardless they are relation or not.
		 * For example:<pre>userService.save(model, ['name', 'birthDay', 'age'])</pre>
		 * </p>
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be the the saved model
		 * with all auto-increment fields populated.
		 */
		public function save(model:Object,
							 completeCallback:Function=null, failCallback:Function=null,
							 attributes:Array=null):CallResponder
		{
			return createServiceCall(remoteObject.save(model, attributes),
				completeCallback, failCallback);
		}
		
		[RESTOperation(method='GET', route="/remove/{0}")]
		/**
		 * Remove a model by its ID
		 *
		 * @param model the model ID to remove
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event is a boolean value
		 * indicates whether the remove action is success or failed.
		 */
		public function remove(id:Object,
							   completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.remove(id),
				completeCallback, failCallback);
		}
		
		[RESTOperation(method='POST', route="/batch-save?fields={1}")]
		/**
		 * Batch save an array of models
		 *
		 * @param models the array of models to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * @param attributes an array of attributes that need to be saved.
		 * If this parameter is null, all attributes that are loaded from DB excepts for relations, will be saved.
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * If the models have auto-increment fields, the <code>result</code> 
		 * field of RESULT event will contains information to retrieve the
		 * auto-increment fields.
		 */
		public function batchSave(models:Array,
								  completeCallback:Function=null, failCallback:Function=null,
								  attributes:Array=null):CallResponder
		{
			return createServiceCall(remoteObject.batchSave(models, attributes),
				completeCallback, failCallback);
		}
		
		[RESTOperation(method='POST', route="/batch-remove")]
		/**
		 * Remove a set of models
		 *
		 * @param items an array of models or model IDs to remove
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event is a boolean value
		 * indicates whether the remove action is success or failed.
		 */
		public function batchRemove(items:Array,
									completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.batchRemove(items),
				completeCallback, failCallback);
		}
		
		/**
		 * Execute an active query and fetch data to an ActiveDataProvider.
		 * @param dataProvider the output data provider
		 * @return a <code>ActiveCallResponder</code> responds for the call.
		 * The <code>result</code> array of RESULT event will be merged into the
		 * data provider.
		 */
		public function fetchData(dataProvider:ActiveDataProvider):ActiveCallResponder
		{
			dataProvider.setService(this);
			var responder:ActiveCallResponder = new ActiveCallResponder(dataProvider);
			createServiceCall(remoteObject.find(dataProvider.criteria, NaN, NaN, null), null, null, responder);
			return responder;
		}
	}
}