package foxy_server_manager;

/***********************
 * @author Raj Dhanani *
 ***********************/

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class hash{
    public static int generate(File A) throws FileNotFoundException, IOException
    {
        int x;
        int hash_key = 0;
        FileReader xeno = new FileReader(A);
        if((x = xeno.read()) == -1) 
        {
            xeno.close();
            return 0;
        }
        do
        {
            hash_key += x;
            x = xeno.read();
        }while(x != -1);
        xeno.close();
        return hash_key;
    }
    public static void create_hash_file(File A) throws IOException
    {
        if(!A.exists()){
            A.createNewFile();
        }
        int hash_key = generate(A);
        File key=new File(A.getParent()+"\\hash_"+A.getName()+".hash");
        key.createNewFile();
        FileWriter xeno = new FileWriter(key);
        //System.out.println(key.getPath());
        xeno.write(Integer.toString(hash_key));
        xeno.close();
    }
    public static boolean hash_check(File A, File B) throws FileNotFoundException, IOException
    {
        int x,y;
        FileReader xeno = new FileReader(A);
        FileReader rdx = new FileReader(B);
        x=xeno.read();
        y=rdx.read();
        while(x!=-1 && y!=-1)
        {
            if(x!=y) return false;
            x=xeno.read();
            y=rdx.read();
        }
        xeno.close();
        rdx.close();
        return x == y;
    }
}