package cc.mrbird.febs.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
@TableName("t_app")
@Data
public class App {

    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    private String appName;

    private Integer status;

    private Date createTime;

    private String createUser;

    private Date modifyTime;

    private String modifyUser;

}
