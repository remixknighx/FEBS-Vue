package cc.mrbird.febs.common.converter;

import cc.mrbird.febs.common.domain.ActiveUser;
import cc.mrbird.febs.common.domain.ActiveUserBO;
import org.mapstruct.Mapper;

/**
 * @author wangjf
 * @date 2020/3/1 0001.
 */
@Mapper(componentModel = "spring")
public interface MapstructMapper {

    ActiveUserBO userToUserBO(ActiveUser activeUser);

}
