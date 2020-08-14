/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Class;
import java.util.*;
/**
 *
 * @author Reza
 */
public class Ctgl {
    

/**
 * A Java Date and Calendar example that shows how to
 * get today's date ("now").
 * 
 * @author alvin alexander, devdaily.com
 */
  public static void main(String[] args)
  {
    // create a calendar instance, and get the date from that
    // instance; it defaults to "today", or more accurately,
    // "now".
    Date today = Calendar.getInstance().getTime();
    
    // print out today's date
    System.out.println(today);
  }

}
