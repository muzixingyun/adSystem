package club.qlulxy.domain;

import java.util.List;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/14 13:51
 * @description：
 * @modified By：
 * @version:
 */
public class StatisticData {
    private Integer maleNum;
    private Integer femaleNum;
    private List<Integer> ageDataList;

    public Integer getMaleNum() {
        return maleNum;
    }

    public void setMaleNum(Integer maleNum) {
        this.maleNum = maleNum;
    }

    public Integer getFemaleNum() {
        return femaleNum;
    }

    public void setFemaleNum(Integer femaleNum) {
        this.femaleNum = femaleNum;
    }

    public List<Integer> getAgeDataList() {
        return ageDataList;
    }

    public void setAgeDataList(List<Integer> ageDataList) {
        this.ageDataList = ageDataList;
    }
}
