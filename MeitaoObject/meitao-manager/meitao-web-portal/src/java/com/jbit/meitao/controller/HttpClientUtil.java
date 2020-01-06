package com.jbit.meitao.controller;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HttpClientUtil {
    public static String doGet(String url, Map<String, String> param) {
        //创建Httpclient 对象
        System.out.println("执行");
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String resultString = "";
        CloseableHttpResponse response = null;
        try {
            //创建Url
            URIBuilder builder = new URIBuilder(url);
            if (param != null) {
                for (String key : param.keySet()) {
                    builder.addParameter(key, param.get(key));
                }
            }
            URI uri = builder.build();//绑定请求的参数
            //创建httpGet 请求
            HttpGet httpGet = new HttpGet(uri);
            //执行请求
            response = httpClient.execute(httpGet);
            //判断返回状态是否为200
            if (response.getStatusLine().getStatusCode() == 200) {
                resultString = EntityUtils.toString(response.getEntity(), "UTF-8");
            }
        } catch (IOException | URISyntaxException e) {
            e.printStackTrace();
        } finally {
            if (response != null) {
                try {
                    response.close();
                    httpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        return resultString;
    }

    public static String doGet(String url) throws IOException {
        return doGet(url, null);
    }

    public static String doPost(String url, Map<String, String> param) {
        //创建、httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        String resultString = "";
        //创建Http POST 的对象
        HttpPost httpPost = new HttpPost(url);
        //创建参数列表
        if (param != null) {
            List<NameValuePair> pairList = new ArrayList<>();
            for (String key : param.keySet()) {
                pairList.add(new BasicNameValuePair(key, param.get(key)));
            }
            //模拟表单
            UrlEncodedFormEntity entity = null;
            try {
                entity = new UrlEncodedFormEntity(pairList);

                httpPost.setEntity(entity);//绑定POST传参
                response = httpClient.execute(httpPost);
                resultString = EntityUtils.toString(response.getEntity(), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (ClientProtocolException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return resultString;
    }

    public static String doPost(String url) throws IOException {
        return doPost(url, null);
    }

    public static String doPostJson(String url, String json) {
        //创建httpclient对象
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        String resultString = null;
        //创建http pOSt请求
        try {
            HttpPost httpPost = new HttpPost(url);
            //创建请求内容
            StringEntity entity = new StringEntity(json, ContentType.APPLICATION_ATOM_XML);
            httpPost.setEntity(entity);
            //执行http请求

            response = httpClient.execute(httpPost);
            resultString = EntityUtils.toString(response.getEntity(), "utf-8");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                response.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return resultString;
    }
}
