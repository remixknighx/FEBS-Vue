package cc.mrbird.febs.system.dao;

import cc.mrbird.febs.system.domain.SysLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogMapper extends BaseMapper<SysLog> {
}