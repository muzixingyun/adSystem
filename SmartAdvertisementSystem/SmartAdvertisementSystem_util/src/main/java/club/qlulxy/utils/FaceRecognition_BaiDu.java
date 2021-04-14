package club.qlulxy.utils;

import com.baidu.aip.face.AipFace;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/7 17:07
 * @description：采用百度的离线接口，用于人脸的检测和识别
 * @modified By：
 * @version: 1.0
 */
@Component
public class FaceRecognition_BaiDu {


    //设置APPID/AK/SK
    public static final String APP_ID = "23928357";
    public static final String API_KEY = "aZbl2Who0DIyuFDdFp86jyws";
    public static final String SECRET_KEY = "m1feNH7L3o7vK1rc7GELjHYx8tXlCUPk";
    //获取相应的存储对应代码的map
    public static final HashMap<String, String> genderHashMap = AttributeHashMapGenerator.getGenderHashMap();
    public static final HashMap<String, String> emotionHashMap = AttributeHashMapGenerator.getEmotionHashMap();
    public static final HashMap<String, String> glassesHashMap = AttributeHashMapGenerator.getGlassesHashMap();

    //传入图片Base64编码，进行人脸识别 返回所有信息
    public static void faceRecognition(String imageBase64Code) {
        // 初始化一个AipFace
        AipFace client = new AipFace(APP_ID, API_KEY, SECRET_KEY);

        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
        // 调用接口
        String imageType = "BASE64";
        // 传入可选参数调用接口
        HashMap<String, String> options = new HashMap<String, String>();
        options.put("face_field", "age,beauty,expression,face_shape,gender,glasses,eye_status,emotion");
        options.put("max_face_num", "5");
        options.put("face_type", "LIVE");
        options.put("liveness_control", "NONE");
        // 人脸检测
        JSONObject res = client.detect(imageBase64Code, imageType, options);
        //从json获取result
        JSONObject result = (JSONObject) res.get("result");
        //从result获取face_list
        JSONArray face_list = (JSONArray) result.get("face_list");
        System.out.println(face_list.length());
        //循环获取face_list中包含的所有人脸的信息
        for (int i = 1; i <= face_list.length(); i++) {
            //输出人脸具体信息
            System.out.println("第" + i + "个人脸的信息如下");
            JSONObject face_list_0 = (JSONObject) face_list.get(i - 1);
            //System.out.println(face_list_0.toString(2));
            JSONObject genderJson = (JSONObject) face_list_0.get("gender");
            String gender = genderJson.getString("type");
            System.out.println("性别：" + gender);
            JSONObject glassesJson = (JSONObject) face_list_0.get("glasses");
            String glasses = glassesJson.getString("type");
            System.out.println("眼镜：" + glasses);
            JSONObject emotionJson = (JSONObject) face_list_0.get("emotion");
            String emotion = emotionJson.getString("type");
            System.out.println("情绪：" + emotion);
            Integer age = face_list_0.getInt("age");
            System.out.println("年龄：" + age);
            Integer beauty = face_list_0.getInt("beauty");
            System.out.println("颜值：" + beauty);
            //输出人脸代码-由01构成的代码 格式为 性别-眼镜(2位)-情绪(3位)-年龄段(3位)-颜值(2位)
            String face_code = "";
            //开始拼接人脸识别结果代码
            //此处使用StringBuilder可以得到更高的开发效率
            //拼接性别代码
            StringBuilder stringBuilder = new StringBuilder();
            for (Map.Entry<String, String> entry : genderHashMap.entrySet()) {
                if (entry.getKey().equals(gender)) {
                    //face_code = stringBuilder.append(face_code).append(entry.getValue()).toString();
                    face_code += entry.getValue();
                    break;
                }
            }
            //拼接眼镜代码
            for (Map.Entry<String, String> entry : glassesHashMap.entrySet()) {
                if (entry.getKey().equals(glasses)) {
                    //face_code = stringBuilder.append(face_code).append(entry.getValue()).toString();
                    face_code += entry.getValue();
                    break;
                }
            }
            //拼接情绪代码
            for (Map.Entry<String, String> entry : emotionHashMap.entrySet()) {
                if (entry.getKey().equals(emotion)) {
                    //face_code = stringBuilder.append(face_code).append(entry.getValue()).toString();
                    face_code += entry.getValue();
                    break;
                }
            }
            //拼接年龄段代码
            face_code += AttributeHashMapGenerator.getAgeCode(age);
            //face_code = stringBuilder.append(face_code).append(AttributeHashMapGenerator.getAgeCode(age)).toString();
            //获取颜值代码
            face_code += AttributeHashMapGenerator.getBeautyCode(beauty);
            //face_code = stringBuilder.append(face_code).append(AttributeHashMapGenerator.getBeautyCode(beauty)).toString();

            System.out.println(face_code);
        }
    }
}
