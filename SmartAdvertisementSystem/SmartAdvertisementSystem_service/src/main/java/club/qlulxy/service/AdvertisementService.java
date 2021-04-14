package club.qlulxy.service;

import club.qlulxy.domain.Advertisement;
import club.qlulxy.domain.StatisticData;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/11 20:21
 * @description：
 * @modified By：
 * @version:
 */
public interface AdvertisementService {


    void adUpload(String path, MultipartFile upload, Advertisement advertisement, String genderSuit, String glassesSuit, String emotionSuit, String ageSuit, String beautySuit) throws IOException;

    List<Advertisement> findAll(Integer page, Integer size);

    void deleteAd(Integer id, String path, String adName);

    List<Advertisement> findAllOnce();

    StatisticData statisticData(String adName, Integer adId);
}
