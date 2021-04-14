package club.qlulxy.utils;

import org.springframework.stereotype.Component;

import java.util.HashMap;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/9 10:10
 * @description：用于生成各个属性的二进制值,存储于hashMap中
 * @modified By：
 * @version: 1.0
 */
@Component
public class AttributeHashMapGenerator {

    /**
     * 获取性别的相关map
     *
     * @return
     */
    public static HashMap<String, String> getGenderHashMap() {
        HashMap<String, String> genderHashMap = new HashMap<>();
        genderHashMap.put("male", "0");
        genderHashMap.put(" female", "1");
        return genderHashMap;
    }

    /**
     * 获取眼镜的相关map
     *
     * @return
     */
    public static HashMap<String, String> getGlassesHashMap() {
        HashMap<String, String> glassesHashMap = new HashMap<>();
        glassesHashMap.put("none", "00");
        glassesHashMap.put("common", "01");
        glassesHashMap.put("sun", "10");
        return glassesHashMap;
    }

    /**
     * 获取情绪的相关map
     *
     * @return
     */
    public static HashMap<String, String> getEmotionHashMap() {
        // angry:愤怒 disgust:厌恶 fear:恐惧 happy:高兴 sad:伤心 surprise:惊讶 neutral:无情绪
        HashMap<String, String> emotionHashMap = new HashMap<>();
        emotionHashMap.put("angry", "000");
        emotionHashMap.put("disgust", "001");
        emotionHashMap.put("fear", "010");
        emotionHashMap.put("happy", "011");
        emotionHashMap.put("sad", "100");
        emotionHashMap.put("surprise", "101");
        emotionHashMap.put("neutral", "110");
        return emotionHashMap;
    }

    /**
     * 根据年龄获取相应二进制代码
     *
     * @return
     */
    public static String getAgeCode(Integer age) {
        //0-5,5-12,12-18,18-25,25-35,35-50,50-70,70+
        if (age >= 0 && age <= 5) {
            return "000";
        } else if (age > 5 && age <= 12) {
            return "001";
        } else if (age > 12 && age <= 18) {
            return "010";
        } else if (age > 18 && age <= 25) {
            return "011";
        } else if (age > 25 && age <= 35) {
            return "100";
        } else if (age > 35 && age <= 50) {
            return "101";
        } else if (age > 50 && age <= 70) {
            return "110";
        } else {
            return "111";
        }
    }

    /**
     * 根据颜值获取相应二进制代码
     *
     * @return
     */
    public static String getBeautyCode(Integer beauty) {
        //0-25,25-50,50-75,75+
        if (beauty >= 0 && beauty <= 25) {
            return "00";
        } else if (beauty > 25 && beauty <= 50) {
            return "01";
        } else if (beauty > 50 && beauty <= 75) {
            return "10";
        } else {
            return "11";
        }
    }
}

