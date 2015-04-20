///////////////////////////////////////////////////////////////////////////////
//
// Licensed Source Code - Property of f-project.net
//
// Copyright © 2014 f-project.net. All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
package net.fproject.serialize
{
	public class SerializeError extends Error
	{
		public static const TYPE_MISMATCH : uint = 150000;
		public static const MISSING_REQUIRED_FIELD : uint = 150001;
		
		public function SerializeError(message : String, id : uint) {
			super(message, id);
		}
	}
}
