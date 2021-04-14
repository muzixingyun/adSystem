package club.qlulxy.domain;

/**
 * @author ：李兴运
 * @date ：Created in 2021/4/11 20:06
 * @description：
 * @modified By：
 * @version:
 */
public class Advertisement {
    private Integer id;
    private String adName;
    private String applyTo;
    private String videoName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }

    public String getApplyTo() {
        return applyTo;
    }

    public void setApplyTo(String applyTo) {
        this.applyTo = applyTo;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    @Override
    public String toString() {
        return "Advertisement{" +
                "id=" + id +
                ", adName='" + adName + '\'' +
                ", applyTo='" + applyTo + '\'' +
                ", videoName='" + videoName + '\'' +
                '}';
    }
}
