package com.jbit.meitao.controller.viewObject;
import com.jbit.meitao.pojo.Privilege;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;
@Data
public class RoleVO {
    private Integer roleId;
    private String roleName;
    private String roleDescription;
    private List<Privilege> privileges;
}
