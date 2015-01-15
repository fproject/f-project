package net.fproject.graphlayout.internalutil
{
   import net.fproject.graphlayout.*;
   import flash.system.*;
   import flash.utils.*;
   import __AS3__.vec.*;


   public class ListOfIntegers extends Object
   {
      public function ListOfIntegers(n:int) {
         super();
         this.vect=new Vector.<int>(n);
         var j:int = 0;
         while(j<n)
         {
            this.vect[j]=0;
            j++;
         }
         return;
      }

      public static const NOT_PRESENT:int = -317;

      public var vect:Vector.<int>;

      protected var begin:int = 0;

      protected var end:int = -1;

      protected var beginIntersSmallBig:int;

      protected var endIntersSmallBig:int;

      protected var beginIntersBigSmall:int;

      protected var endIntersBigSmall:int;

      public final function duplicate() : ListOfIntegers {
         var newList:ListOfIntegers = new ListOfIntegers(this.vect.length);
         newList.begin=this.begin;
         newList.end=this.end;
         TranslateUtil.copyVector(this.vect,0,newList.vect,0,this.vect.length);
         return newList;
      }

      public final function deleteAll() : void {
         this.begin=0;
         this.end=-1;
         return;
      }

      public final function isEmpty() : Boolean {
         return (this.end<0)||(this.end-this.begin<0);
      }

      public final function append(n:int) : void {
         var _loc2_:* = ++this.end;
         this.vect[_loc2_]=n;
         return;
      }

      public final function getBegin() : int {
         return this.begin;
      }

      public final function getEnd() : int {
         return this.end;
      }

      final function setBeginIntersSmallBig(beg:int) : void {
         this.beginIntersSmallBig=beg;
         return;
      }

      final function setEndIntersSmallBig(end:int) : void {
         this.endIntersSmallBig=end;
         return;
      }

      final function getBeginIntersSmallBig() : int {
         return this.beginIntersSmallBig;
      }

      final function getEndIntersSmallBig() : int {
         return this.endIntersSmallBig;
      }

      final function setBeginIntersBigSmall(beg:int) : void {
         this.beginIntersBigSmall=beg;
         return;
      }

      final function setEndIntersBigSmall(end:int) : void {
         this.endIntersBigSmall=end;
         return;
      }

      final function getBeginIntersBigSmall() : int {
         return this.beginIntersBigSmall;
      }

      final function getEndIntersBigSmall() : int {
         return this.endIntersBigSmall;
      }

      public final function set(i:int, n:int) : void {
         this.vect[i]=n;
         return;
      }

      public final function get(i:int) : int {
         if(i<this.vect.length)
         {
            return this.vect[i];
         }
         return NOT_PRESENT;
      }

      public final function getFirst() : int {
         if(this.isEmpty())
         {
            LogResUtil.logAndThrowRuntimeExc(GraphLayout,"graphlayout.expert.message.6083E");
         }
         return this.vect[this.begin];
      }

      public final function getFirstIndex(n:int) : int {
         var i:int = this.begin;
         while(i<=this.end)
         {
            if(this.vect[i]==n)
            {
               return i;
            }
            i++;
         }
         return NOT_PRESENT;
      }

      public final function length() : int {
         return this.end-this.begin+1;
      }

      public final function clear() : void {
         this.begin=0;
         this.end=-1;
         return;
      }
   }

}