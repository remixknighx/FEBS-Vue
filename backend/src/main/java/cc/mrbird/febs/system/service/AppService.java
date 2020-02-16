package cc.mrbird.febs.system.service;

import cc.mrbird.febs.common.domain.QueryRequest;
import cc.mrbird.febs.system.domain.App;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author wangjf
 * @date 2020/2/1 0001.
 */
public interface AppService extends IService<App> {

    IPage<App> findApps(QueryRequest request, App app);

    App findAppById(String id) throws Exception;

}
