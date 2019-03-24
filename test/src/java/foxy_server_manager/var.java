package foxy_server_manager;

/***********************
 * @author Raj Dhanani *
 ***********************/


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class var{
   //public static int i=0;
   //public static String File_name[] = new String[10];
   public static Collection<String> File_name = new ArrayList<String>();
    public static boolean possible(String A){
       for(Iterator<String> i = File_name.iterator(); i.hasNext();)
       {
           if(((String)i.next()).equals(A)) 
           {
               System.out.println("FILE ALREADY IN THE SYSTEM!!!");
               return false;
           }
       }
       File a=new File(ServerFiles.upload_folder + "user1" + "\\A\\"+A);
       if(a.exists()){
            File_name.add(A);
            return true;
       }
       else{
            System.out.println("FILE DOES NOT EXIST!!!");
            return false;
       }
   }
}