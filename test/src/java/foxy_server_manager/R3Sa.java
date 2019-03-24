package foxy_server_manager;

/***********************
 * @author Raj Dhanani *
 ***********************/


import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class R3Sa extends Thread{
    String File_name;
    void donothing() throws IOException{
        File temp=new File("temp");
        if(temp.exists())temp.delete();
        else temp.createNewFile();
    }
    public R3Sa(String A){
        super("Sub Thread");
        File_name=A;
        start();
    }
    public void run(){
        try {
            File block1 = new File(ServerFiles.upload_folder + "user1" + "\\A\\"+File_name);
            File block2 = new File(ServerFiles.upload_folder + "user1" + "\\B\\"+File_name);
            File block3 = new File(ServerFiles.upload_folder + "user1" + "\\C\\"+File_name);
            hash.create_hash_file(block1);
            hash.create_hash_file(block2);
            hash.create_hash_file(block3);
            System.out.println("SYSTEM STARTS NOW>>>>");
            while(true)
            {   donothing();
                while(FLAG.under_watch){
                    //System.out.println("FLAG:"+FLAG.under_watch);
                    block.keep_intact(block1, block2, block3);
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(R3Sa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }    
}
