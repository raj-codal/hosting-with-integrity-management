package foxy_server_manager;

/***********************
 * @author Raj Dhanani *
 ***********************/


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class block{
    public static void keep_intact(File A, File B, File C) throws IOException
    {
        hash.create_hash_file(A);
        hash.create_hash_file(B);
        hash.create_hash_file(C);
        
        String file_name = A.getName();
        
        File hashA=new File(A.getParent()+"\\hash_"+A.getName()+".hash");
        File hashB=new File(B.getParent()+"\\hash_"+A.getName()+".hash");
        File hashC=new File(C.getParent()+"\\hash_"+A.getName()+".hash");
        
        if(hash.hash_check(hashA, hashB) == false)
        {
            if(A.lastModified()>B.lastModified())
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK A MODIFIED!! REPLACED WITH B");
                //list2.add("BLOCK A MODIFIED!! REPLACED WITH B");
                replace(A,B);
                hash.create_hash_file(A);
            }
            else
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK B MODIFIED!! REPLACED WITH A");
                //list2.add("BLOCK B MODIFIED!! REPLACED WITH A");
                replace(B,A);
                hash.create_hash_file(B);
            }
        }
        if(hash.hash_check(hashB, hashC) == false)
        {
            if(B.lastModified()>C.lastModified())
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK B MODIFIED!! REPLACED WITH C");
                //list2.add("BLOCK B MODIFIED!! REPLACED WITH C");
                replace(B,C);
                hash.create_hash_file(B);
            }
            else
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK C MODIFIED!! REPLACED WITH B");
                //list2.add("BLOCK C MODIFIED!! REPLACED WITH B");
                replace(C,B);
                hash.create_hash_file(C);
            }
        }
        if(hash.hash_check(hashC, hashA) == false)
        {
            if(C.lastModified()>A.lastModified())
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK C MODIFIED!! REPLACED WITH A");
                //list2.add("BLOCK C MODIFIED!! REPLACED WITH A");
                replace(C,A);
                hash.create_hash_file(C);
            }
            else
            {
                System.out.println("FOR FILE:"+file_name);
                System.out.println("BLOCK A MODIFIED!! REPLACED WITH C");
                //list2.add("BLOCK A MODIFIED!! REPLACED WITH C");
                replace(A,C);
                hash.create_hash_file(A);
            }
        }
    }
    public static void replace(File A,File B) throws FileNotFoundException, IOException
    {
        int a;
        FileReader xeno = new FileReader(B);
        FileWriter rdx = new FileWriter(A);
        a=xeno.read();
        while(a!=-1)
        {
            rdx.write(a);
            a=xeno.read();
        }      
        xeno.close();
        rdx.close();
    }
}
