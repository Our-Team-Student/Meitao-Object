package com.jbit.meitao.pojo;

import lombok.Data;

import java.util.List;

@Data
public class Privilege {
    private Integer privilegeId;

    private String privilegeName;

    private List<Functions> functionsList;
}