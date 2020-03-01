package cc.mrbird.febs.common.domain;

import lombok.Data;

/**
 * @author wangjf
 * @date 2020/3/1 0001.
 */
@Data
public class ActiveUserBO {
    private String id;
    // 用户名
    private String username;
    // ip地址
    private String ip;
    // token(加密后)
    private String token;
    // 登录时间
    private String loginTime;
    // 登录地点
    private String loginAddress;
}
