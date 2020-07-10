package com.rehnuma.springbootsecurity.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private int id;



    @Column(name = "name")
    @Enumerated(EnumType.STRING)
    private RoleType roleType;


    public Role() {
    }

    public Role(RoleType roleType){
        this.roleType=roleType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public RoleType getRoleType() {
        return roleType;
    }

    public void setRoleType(RoleType roleType) {
        this.roleType = roleType;
    }


}
