package net.fproject.model
{
	/**
	 * The abstract class for all hierachical item that implement optimistic locking
	 * 
	 * @author Bui Sy Nguyen
	 * 
	 */
	public class OptimisticLockHierarchicalItem extends HierarchicalItem implements IOptimisticLockModel
	{
		private var _version:Number;
		
		/**
		 * The version number, used for optimistic locking.
		 * Do not manually modify this value.
		 */
		public function get version():Number
		{
			return _version;
		}
		
		public function set version(value:Number):void
		{
			_version = value;
		}
	}
}