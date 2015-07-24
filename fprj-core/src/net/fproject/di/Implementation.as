///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2015 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.di
{
	/**
	 * 
	 * The implementation config for an interface or an abstract class.
	 * 
	 */
	public class Implementation
	{
		/**
		 * The the abstractor class
		 */
		public var abstractor:Class;
		
		/**
		 * The implementation class
		 */
		public var impl:Class;
		
		public function Implementation(abstractor:Class=null, impl:Class=null)
		{
			this.abstractor = abstractor;
			this.impl = impl;
		}
	}
}