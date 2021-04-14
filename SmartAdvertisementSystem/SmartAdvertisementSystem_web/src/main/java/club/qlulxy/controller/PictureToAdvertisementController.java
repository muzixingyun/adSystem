package club.qlulxy.controller;

import club.qlulxy.utils.FaceRecognition_BaiDu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author ：李兴运
 * @date ：Created in 2021/3/29 10:47
 * @description：用于前端获取图片后转化为视频广告
 * @modified By：
 * @version: 1.0
 */
@Controller
@RequestMapping("/adControl")
public class PictureToAdvertisementController {


    @Autowired
    FaceRecognition_BaiDu faceRecognition_baiDu;

    /**
     * 根据前端传入的base64编码获取相应的广告播放列表
     * @param pictureBase64Url
     */
    @RequestMapping("/pictureToAd")
    public void pictureToAdvertisement(String pictureBase64Url) {
        //去除base64头捕信息，保留主要信息
        String endPictureBase64Url = pictureBase64Url.replace("data:image/png;base64,", "");
        //调用百度人脸识别
        faceRecognition_baiDu.faceRecognition(endPictureBase64Url);
    }
}
