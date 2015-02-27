///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.service
{
	import mx.rpc.CallResponder;

	/**
	 * <p>ActiveService implements a common set of operations for supporting remote access 
	 * to RESTful or AMF service.</p>
	 *
	 * <p>In case of working with JSON, by default the service uses a model class to deserialize/serialize
	 * data in sending/receieving remote message. The model class should be specified via 
	 * <code>modelClass</code> getter, which must have the following singature:</p>
	 * <pre>public function get modelClass():Class</pre>
	 * <p>By default, the following operations are supported:</p>
	 * <ul>
	 * <li><code>findOne</code>: Return the details of a model (model) by primary keys (ID)</li>
	 * <li><code>find</code> Find a list of models by searching condition and pagination information</li>
	 * <li><code>save</code> Insert a new model or update an existing model if the ID fields are specified</li>
	 * <li><code>remove</code> Delete an existing model by primary keys (ID)</li>
	 * <li><code>batchSave</code> Batch-save an array of models</li>
	 * <li><code>batchRemove</code> Batch-remove a list of models by specifying a list of IDs</li>
	 * </ul>
	 *
	 * <p>
	 * To modify existing operation or add a new one, either override existing operation or 
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
		 * Returns a single model instance by a primary key or a compsite value of primary key.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a single customer whose primary key value is 10
		 * customer = customerService.findOne(10);
		 * 
		 * // find a single customer whose composite primary key value is "11,20"
		 * customer = customerService.findOne("11,20");</pre>
		 *
		 * @param id primary key value or a compsite value of primary key 
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be a model instance 
		 * matching the condition, or null if nothing matches.
		 */
		public function findOne(id:String,
								completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.findOne(id),
				completeCallback, failCallback);
		}
		
		/**
		 * Finds models by a filter condition and returns a set of model instances with pagination.
		 *
		 * For example,
		 *
		 * <pre>
		 * // find a all customers whose name is like "ABC"
		 * customer = customerService.find({condition:"name LIKE {name}",name:"ABC"});
		 * 
		 * // find a all customers whose name is like "ABC", paging with 10 records per page and
		 * // seek to page 2
		 * customer = customerService.find({condition:"name LIKE {name}",name:"ABC"},{page:2, perPage:10});</pre>
		 *
		 * @param filter the filter condition
		 * @param pagination the pagination information
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be an array of model instances
		 * matching the condition, or null if nothing matches.
		 */
		public function find(filter:Object=null, pagination:Object=null,
								completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.find(filter, pagination),
				completeCallback, failCallback);
		}
		
		
		/**
		 * Save a model object
		 *
		 * @param model the model to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * The <code>result</code> field of RESULT event will be the the saved model
		 * with all auto-increment fields populated.
		 */
		public function save(model:Object,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.save(model),
				completeCallback, failCallback);
		}
		
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
		public function remove(id:String,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.remove(id),
				completeCallback, failCallback);
		}
		
		/**
		 * Batch save an array of models
		 *
		 * @param models the array of models to save
		 * 
		 * @param completeCallback The call-back function that will be invoked after
		 * the remote object call succesfully returned.
		 * @param failCallback The call-back function that will be invoked after
		 * the remote object call failed
		 * 
		 * @return a <code>CallResponder</code> responds for the call.
		 * If the models have auto-increment fields, the <code>result</code> 
		 * field of RESULT event will contains information to retrieve the
		 * auto-increment fields.
		 */
		public function batchSave(models:Array,
							 completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.batchSave(models),
				completeCallback, failCallback);
		}
		
		/**
		 * Remove a set of models by IDs
		 *
		 * @param model an array of model IDs to remove
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
		public function batchRemove(ids:Array,
							   completeCallback:Function=null, failCallback:Function=null):CallResponder
		{
			return createServiceCall(remoteObject.batchRemove(ids),
				completeCallback, failCallback);
		}
	}
}