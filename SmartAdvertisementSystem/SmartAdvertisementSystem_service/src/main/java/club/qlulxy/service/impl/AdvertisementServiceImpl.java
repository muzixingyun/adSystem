package club.qlulxy.service.impl;

import club.qlulxy.dao.AdvertisementDao;
import club.qlulxy.domain.Advertisement;
import club.qlulxy.domain.StatisticData;
import club.qlulxy.service.AdvertisementService;
import club.qlulxy.utils.DateUtil;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/11 20:22
 * @description：
 * @modified By：
 * @version:
 */
@Service("advertisementService")
public class AdvertisementServiceImpl implements AdvertisementService {

    public static final int[] ageList = {0, 5, 12, 18, 25, 35, 50, 70, 200};

    @Autowired
    private AdvertisementDao advertisementDao;

    /**
     * 在此方法中进行文件上传的业务逻辑
     *
     * @param path
     * @param upload
     * @param advertisement
     * @param genderSuit
     * @param glassesSuit
     * @param emotionSuit
     * @param ageSuit
     * @param beautySuit
     * @throws IOException
     */
    @Override
    public void adUpload(String path, MultipartFile upload, Advertisement advertisement, String genderSuit, String glassesSuit, String emotionSuit, String ageSuit, String beautySuit) throws IOException {
        //获取广告文件名名称并存储到advertisement中
        String fileName = upload.getOriginalFilename();
        advertisement.setVideoName(fileName);
        //将前端传来的适合类型转换为相应代码
        advertisement.setApplyTo("-----------");
        //将广告文件存储到数据库
        advertisementDao.adUpload(advertisement);
        //将文件存储到文件夹中
        File file = new File(path);
        System.out.println(file.exists());
        if (!file.exists()) {
            file.mkdirs();
        }
        upload.transferTo(new File(path, fileName));
        System.out.println(advertisement.toString());
    }

    @Override
    public List<Advertisement> findAll(Integer page, Integer size) {
        //将查询到的广告分页存储
        PageHelper.startPage(page, size);
        return advertisementDao.finAll();
    }

    @Override
    public void deleteAd(Integer id, String path, String videoName) {
        //在数据库中删除文件
        advertisementDao.deleteAd(id);
        //在文件夹中删除文件
        File file = new File(path, videoName);
        if (file.exists()) {
            file.delete();
        } else {
            System.out.println("文件不存在");
        }
    }

    @Override
    public List<Advertisement> findAllOnce() {
        return advertisementDao.finAll();
    }

    @Override
    public StatisticData statisticData(String adName, Integer adId) {
        //Map<String, Integer> data = new HashMap<>();
        int maleData;//男性人数
        int femaleData;//女性人数
        List<Integer> ageDataList;//各年龄段人数
        List<Integer> nowWeekDataList;//本周数据
        List<Integer> lastWeekDataList;//上周数据
        StatisticData data = new StatisticData();
        if (adName.equals("all")) {
            //查询各个性别人数
            maleData = advertisementDao.statisticAllGenderData("male");
            femaleData = advertisementDao.statisticAllGenderData("female");
            data.setMaleNum(maleData);
            data.setFemaleNum(femaleData);
            //根据年龄的ageList查询所有的年龄段人数
            ageDataList = new ArrayList<>();
            int min = 0, max = 0;
            for (int i = 0; i < 8; i++) {
                min = ageList[i];
                max = ageList[i + 1];
                int num = advertisementDao.statisticAllAgeData(min, max);
                ageDataList.add(num);
            }
            data.setAgeDataList(ageDataList);
            //根据日期查询一星期内的播放数量
            String now = DateUtil.date2String(new Date(), "yy-MM-dd HH:mm:ss");
            //获取本周的数据
            nowWeekDataList = new ArrayList<>();
            //首先获取当前星期
            Integer week = DateUtil.getWeek();
            //根据当前日期，查询本周数据
            Date date;
            String dateMin, dateMax;
            for (int i = 0; i < week; i++) {
                date = DateUtil.getSomeDay(0 - week + 1 + i);
                dateMin = DateUtil.date2String(date, "yy-MM-dd 00:00:00");
                dateMax = DateUtil.date2String(date, "yy-MM-dd 23:59:59");
                Integer playNum = advertisementDao.statisticAllWeekData(dateMin, dateMax);
                nowWeekDataList.add(playNum);
            }
            //不足一星期补0
            for (int i = week; i < 7; i++) {
                nowWeekDataList.add(0);
            }
            data.setNowWeekDataList(nowWeekDataList);
            //获取上周的数据
            lastWeekDataList = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                date = DateUtil.getSomeDay(0 - week - 7 + 1 + i);
                dateMin = DateUtil.date2String(date, "yy-MM-dd 00:00:00");
                dateMax = DateUtil.date2String(date, "yy-MM-dd 23:59:59");
                Integer playNum = advertisementDao.statisticAllWeekData(dateMin, dateMax);
                lastWeekDataList.add(playNum);
            }
            data.setLastWeekDataList(lastWeekDataList);
        } else {
            //查询各个性别人数
            maleData = advertisementDao.statisticOneGenderData("male", adId);
            femaleData = advertisementDao.statisticOneGenderData("female", adId);
            data.setMaleNum(maleData);
            data.setFemaleNum(femaleData);
            //根据年龄的ageList查询所有的年龄段人数
            ageDataList = new ArrayList<>();
            int min = 0, max = 0;
            for (int i = 0; i < 8; i++) {
                min = ageList[i];
                max = ageList[i + 1];
                int num = advertisementDao.statisticOneAgeData(min, max, adId);
                ageDataList.add(num);
            }
            data.setAgeDataList(ageDataList);
            //根据日期查询一星期内的播放数量
            String now = DateUtil.date2String(new Date(), "yy-MM-dd HH:mm:ss");
            //获取本周的数据
            nowWeekDataList = new ArrayList<>();
            //首先获取当前星期
            Integer week = DateUtil.getWeek();
            //根据当前日期，查询本周数据
            Date date;
            String dateMin, dateMax;
            for (int i = 0; i < week; i++) {
                date = DateUtil.getSomeDay(0 - week + 1 + i);
                dateMin = DateUtil.date2String(date, "yy-MM-dd 00:00:00");
                dateMax = DateUtil.date2String(date, "yy-MM-dd 23:59:59");
                Integer playNum = advertisementDao.statisticOneWeekData(dateMin, dateMax, adId);
                nowWeekDataList.add(playNum);
            }
            //不足一星期补0
            for (int i = week; i < 7; i++) {
                nowWeekDataList.add(0);
            }
            data.setNowWeekDataList(nowWeekDataList);
            //获取上周的数据
            lastWeekDataList = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                date = DateUtil.getSomeDay(0 - week - 7 + 1 + i);
                dateMin = DateUtil.date2String(date, "yy-MM-dd 00:00:00");
                dateMax = DateUtil.date2String(date, "yy-MM-dd 23:59:59");
                Integer playNum = advertisementDao.statisticOneWeekData(dateMin, dateMax, adId);
                lastWeekDataList.add(playNum);
            }
            data.setLastWeekDataList(lastWeekDataList);
        }
        return data;
    }
}
