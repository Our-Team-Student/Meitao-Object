package com.jbit.meitao.pojo;

import lombok.Data;
import lombok.NonNull;

import java.util.List;

@Data
public class Role {
    private Integer roleId;

    private String roleName;

    private String roleDescription;
    private List<Privilege> privileges;
}