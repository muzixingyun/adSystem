package club.qlulxy.controller;

import club.qlulxy.domain.Advertisement;
import club.qlulxy.domain.StatisticData;
import club.qlulxy.service.AdvertisementService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/11 11:27
 * @description：
 * @modified By：
 * @version:
 */
@Controller
@RequestMapping("/advertisement")
@MultipartConfig
public class AdvertisementController {

    @Autowired
    private AdvertisementService advertisementService;

    /**
     * 完成上传广告的功能，存储视频文件并上传到数据库
     *
     * @param request
     * @param upload
     * @throws IOException
     */
    @RequestMapping("/adUpload")
    public String adUpload(HttpServletRequest request, MultipartFile upload, Advertisement advertisement, String genderSuit,
                           String glassesSuit, String emotionSuit, String ageSuit, String beautySuit) throws IOException {

        //获取文件存储路径
        String path = request.getSession().getServletContext().getRealPath("/videos/");
        //调用service进行上传，在service进行逻辑处理
        advertisementService.adUpload(path, upload, advertisement, genderSuit, glassesSuit, emotionSuit, ageSuit, beautySuit);
        return "redirect:findAll";
    }


    /**
     * 查询所有的广告信息，用于前端展示，实现增加删除功能
     *
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model, @RequestParam(defaultValue = "1", required = true, name = "page") Integer page,
                          @RequestParam(required = true, defaultValue = "10", name = "size") Integer size) {
        //将广告分页存储，转换成pageInfo传到前端
        List<Advertisement> adList = advertisementService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(adList);
        model.addAttribute("pageInfo", pageInfo);
        return "ad-manage";
    }

    /**
     * 根据id删除一条广告
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteAd")
    public String deleteAd(HttpServletRequest request, Integer id, String videoName) {
        //获取文件存储路径
        String path = request.getSession().getServletContext().getRealPath("/videos/");
        advertisementService.deleteAd(id, path, videoName);
        return "redirect:findAll";
    }

    /**
     * 统计某个广告的数据
     *
     * @param adName
     * @return
     */
    @RequestMapping("/statisticData")
    public String statisticData(String adName, @RequestParam(required = false, defaultValue = "0") Integer adId, Model model) {
        //一次性查询所有的广告，不分页
        List<Advertisement> adList = advertisementService.findAllOnce();
        model.addAttribute("adList", adList);
        //查询某个广告的数据信息
        StatisticData data = advertisementService.statisticData(adName, adId);
        model.addAttribute("data", data);
        return "ad-chart";
    }
}
