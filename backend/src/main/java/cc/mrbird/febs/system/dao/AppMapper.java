package cc.mrbird.febs.system.dao;

import cc.mrbird.febs.system.domain.App;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
@Mapper
public interface AppMapper extends BaseMapper<App> {

    int deleteApp(Long appId);

}
