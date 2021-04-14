package club.qlulxy.controller;


import java.io.*;
import java.util.Base64;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/1 12:29
 * @description：
 * @modified By：
 * @version:
 */
public class Imagebase64 {

    public InputStream BaseToInputStream(String base64string) {
//        if (base64string == null && filePath == null) {
//            return "生成文件失败，请给出相应的数据。";
//        }
//        try {
//            Files.write(Paths.get(filePath), Base64.getMimeDecoder().decode(base64string), StandardOpenOption.CREATE);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return "指定路径下生成文件成功！";
        ByteArrayInputStream stream = null;
        try {
            byte[] bytes1 = Base64.getDecoder().decode(base64string);
            stream = new ByteArrayInputStream(bytes1);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return stream;
    }


    public static void writeFileString(String base64String) {
        File file = new File("D:\\zkn");
        if (!file.isDirectory())
            file.mkdir();//创建目录
        File fileDir = new File(file, "zkn.txt");
        if (!fileDir.isFile()) {
            try {
                fileDir.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            FileWriter fw = new FileWriter(fileDir);//FileWriter写入文件时不能指定编码格式，编码格式是系统默认的编码格式
            fw.write(base64String); //向文件中写入字符串
            fw.flush(); //刷新
            fw.close(); //关闭流
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
