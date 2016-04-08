package net.fproject.utils
{
	import flash.utils.ByteArray;
	
	import mx.utils.Base64Decoder;
	import mx.utils.Base64Encoder;
	
	public class Base64
	{
		private var _encoder:Base64Encoder;
		/**
		 * 
		 * The Base64 Encoder utility 
		 * 
		 */
		public function getEncoder(reset:Boolean=false):Base64Encoder
		{
			if(_encoder == null)
				_encoder = new Base64Encoder;
			else if(reset)
				_encoder.reset();
			return _encoder;
		}
		
		/**
		 * 
		 * The Base64 Encoder utility 
		 * 
		 */
		public function get encoder():Base64Encoder
		{
			return getEncoder();
		}
		
		private var _decoder:Base64Decoder;
		/**
		 * 
		 * The Base64 Decoder utility 
		 * 
		 */
		public function getDecoder(reset:Boolean=false):Base64Decoder
		{
			if(_decoder == null)
				_decoder = new Base64Decoder;
			else if(reset)
				_decoder.reset();
			return _decoder;
		}
		
		/**
		 * 
		 * The Base64 Decoder utility 
		 * 
		 */
		public function get decoder():Base64Decoder
		{
			return getDecoder();
		}
		
		private static var _instance:Base64;
		/**
		 * 
		 * Singleton
		 * 
		 */
		public static function getInstance(reset:Boolean=true):Base64
		{
			if(_instance == null)
				_instance = new Base64();
			return _instance;
		}
		
		/**
		 * Encodes a ByteArray in Base64.
		 * 
		 * @param data The ByteArray to encode.
		 * @param offset The index from which to start encoding.
		 * @param length The number of bytes to encode from the offset.
		 * @return The Base64 encoded String. Note that
		 * calling this method also clears the buffer and resets the 
		 * <code>encoder</code> to its initial state.
		 */
		public static function encodeBytes(data:ByteArray, offset:uint=0, length:uint=0):String
		{
			getInstance().getEncoder(true).encodeBytes(data, offset, length);
			return _instance._encoder.toString();
		}
		
		/**
		 * Decodes a Base64 encoded String. Strings must be in ASCII format. 
		 * 
		 * <p>Subsequent calls to this method add on to the internal
		 * buffer. After all data have been encoded, call <code>toByteArray()</code>
		 * to obtain a decoded <code>flash.utils.ByteArray</code>.</p>
		 * 
		 * @param encoded The Base64 encoded String to decode.
		 * 
		 * @return The decoded <code>flash.utils.ByteArray</code>.
		 * Note that calling this method also clears the buffer and resets the 
		 * <code>decoder</code> to its initial state.
		 */
		public static function decodeToBytes(encoded:String):ByteArray
		{
			getInstance().getDecoder(true).decode(encoded);
			return _instance._decoder.toByteArray();
		}
	}
}