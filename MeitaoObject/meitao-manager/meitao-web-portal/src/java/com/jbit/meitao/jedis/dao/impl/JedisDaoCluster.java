package com.jbit.meitao.jedis.dao.impl;

import com.jbit.meitao.jedis.dao.JedisDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;


import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

public class JedisDaoCluster implements JedisDao {

    @Autowired
    private JedisCluster jedisCluster;

    @Override
    public String get(String key) {

        return jedisCluster.get(key);
    }

    @Override
    public String set(String key, String value) {

        return jedisCluster.set(key, value);
    }

    @Override
    public String hget(String hkey, String key) {
        System.out.println("执行查找");

        String hget = jedisCluster.hget(hkey, key);
        System.out.println(hget + "----------");
        return hget;
    }

    @Override
    public long hset(String hkey, String key, String value) {

        return jedisCluster.hset(hkey, key, value);
    }
    @Override
    public long incr(String key) {
        return jedisCluster.incr(key);
    }

    @Override
    public long expire(String key, int second) {
        return jedisCluster.expire(key, second);
    }

    @Override
    public long ttl(String key) {
        return jedisCluster.ttl(key);
    }

    @Override
    public long del(String key) {
        return jedisCluster.del(key);
    }

    @Override
    public long hdel(String hkey, String key) {
        return jedisCluster.hdel(hkey, key);
    }

    @Override
    public long decrby(String key) {
        // TODO Auto-generated method stub
        return 0;
    }

}
