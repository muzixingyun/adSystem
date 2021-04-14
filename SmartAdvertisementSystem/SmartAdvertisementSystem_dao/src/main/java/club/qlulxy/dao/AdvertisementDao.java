package club.qlulxy.dao;

import club.qlulxy.domain.Advertisement;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/11 20:36
 * @description：
 * @modified By：
 * @version:
 */
@Repository
public interface AdvertisementDao {

    @Insert("insert into advertisements (adName,applyTo,videoName) values(#{adName},#{applyTo},#{videoName})")
    public void adUpload(Advertisement advertisement);


    @Select("select * from advertisements")
    List<Advertisement> finAll();

    @Delete("delete from advertisements where id = #{id}")
    void deleteAd(Integer id);

    @Select("select count(*) from ad_effect where audienceGender = #{gender}")
    int statisticAllGenderData(String gender);


    @Select("select count(*) from ad_effect where audienceAge >= #{min} and audienceAge < #{max}")
    int statisticAllAgeData(@Param("min") int min,@Param("max") int max);
}
