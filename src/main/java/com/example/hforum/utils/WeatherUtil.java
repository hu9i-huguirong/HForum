package com.example.hforum.utils;

import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWebService;
import cn.com.webxml.WeatherWebServiceSoap;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WeatherUtil {

    public static List<String> webServiceAPI(String cityName) {
        WeatherWebService weatherWebService = new WeatherWebService();
        WeatherWebServiceSoap weatherWebServiceSoap = weatherWebService.getWeatherWebServiceSoap();
        ArrayOfString array = weatherWebServiceSoap.getWeatherbyCityName(cityName);
        List<String> list = array.getString();
        return list;
    }

    public static String soJsonAPI(String cityName) throws IOException {
        //参数url化
        String city = java.net.URLEncoder.encode(cityName, "utf-8");

        //拼地址
        String apiUrl = String.format("https://www.sojson.com/open/api/weather/json.shtml?city=%s", city);
        //开始请求
        URL url = new URL((apiUrl));
        URLConnection open = url.openConnection();
        InputStream input = open.getInputStream();
        //这里转换为String，带上包名，怕你们引错包
        String result = org.apache.commons.io.IOUtils.toString(input, "utf-8");
        //输出
        return result;
    }

    public static List<String> nowAPI(String cityName) throws IOException {

        cityName= java.net.URLEncoder.encode(cityName, "utf-8");//特么居然要编码,不然就返回失败 我擦
        List<String> list = new ArrayList<>(2);
        //拼地址 天气
        String apiUrl1 = String.format("http://api.k780.com/?app=weather.future&weaid=%s&&appkey=30960&sign=e816e313e2205e8ab9484c902ac3c2b8&format=json", cityName);

        //生活指数
        String apiUrl2 = String.format("http://api.k780.com/?app=weather.lifeindex&weaid=%s&appkey=30960&sign=e816e313e2205e8ab9484c902ac3c2b8&format=json", cityName);
        URL u1 = new URL(apiUrl1);
        URL u2 = new URL(apiUrl2);

        URLConnection open1 = u1.openConnection();
        InputStream is1 = open1.getInputStream();

        URLConnection open2 = u2.openConnection();
        InputStream is2 = open2.getInputStream();
        String result1 = org.apache.commons.io.IOUtils.toString(is1, "utf-8");
        String result2 = org.apache.commons.io.IOUtils.toString(is2, "utf-8");
        list.add(result1);
        list.add(result2);
        return list;
    }
    /**
     * 以下转换成我们需要的数据格式
     *
     * @param cityName
     * @return
     * @throws IOException
     */
    public static List<Map<String, Object>> getWeatherByWebServiceAPI(String cityName) throws IOException {

        List<String> list = webServiceAPI(cityName);
        List<Map<String, Object>> threeWeather = new ArrayList<>(3);

        Map<String, Object> data1 = new HashMap<>();
        data1.put("cityName", list.get(1));
        data1.put("weatherDes", list.get(6).substring(list.get(6).indexOf(" ") + 1, list.get(6).length()));
        String[] s1 = list.get(5).split("/");
        data1.put("min", s1[0].replace("℃", ""));
        data1.put("max", s1[1].replace("℃", ""));
        data1.put("wind", list.get(7));
        data1.put("air", list.get(10).substring(list.get(10).indexOf("空气质量：") + 5, list.get(10).length() - 1));

        Map<String, Object> data2 = new HashMap<>();
        data2.put("weatherDes", list.get(13).substring(list.get(13).indexOf(" ") + 1, list.get(13).length()));
        String[] s2 = list.get(12).split("/");
        data2.put("min", s2[0].replace("℃", ""));
        data2.put("max", s2[1].replace("℃", ""));

        Map<String, Object> data3 = new HashMap<>();
        data3.put("weatherDes", list.get(18).substring(list.get(18).indexOf(" ") + 1, list.get(18).length()));
        String[] s3 = list.get(17).split("/");
        data3.put("min", s3[0].replace("℃", ""));
        data3.put("max", s3[1].replace("℃", ""));

        threeWeather.add(data1);
        threeWeather.add(data2);
        threeWeather.add(data3);

        return threeWeather;
    }


    public static List<Map<String, Object>> getWeatherBySoJsonAPI(String cityName) throws IOException {

        List<Map<String, Object>> threeWeather = new ArrayList<>(3);

        String weatherData = soJsonAPI(cityName);
        JSONObject weatherObject = new JSONObject(weatherData);
        JSONObject dataObject = weatherObject.getJSONObject("data");
        JSONArray forecast = dataObject.getJSONArray("forecast");

        JSONObject jo1 = forecast.getJSONObject(0);
        Map<String, Object> data1 = new HashMap<>();
        data1.put("cityName", weatherObject.getString("city"));

        data1.put("weatherDes", jo1.getString("type"));
        data1.put("min", (jo1.getString("low").replace("低温 ", "")).replace(".0℃", ""));
        data1.put("max", (jo1.getString("high").replace("高温 ", "")).replace(".0℃", ""));
        data1.put("wind", jo1.getString("fx") + jo1.getString("fl"));
        data1.put("air", dataObject.getString("quality"));

        JSONObject jo2 = forecast.getJSONObject(1);
        Map<String, Object> data2 = new HashMap<>();
        data2.put("weatherDes", jo2.getString("type"));
        data2.put("min", (jo2.getString("low").replace("低温 ", "")).replace(".0℃", ""));
        data2.put("max", (jo2.getString("high").replace("高温 ", "")).replace(".0℃", ""));

        JSONObject jo3 = forecast.getJSONObject(2);
        Map<String, Object> data3 = new HashMap<>();
        data3.put("weatherDes", jo3.getString("type"));
        data3.put("min", (jo3.getString("low").replace("低温 ", "")).replace(".0℃", ""));
        data3.put("max", (jo3.getString("high").replace("高温 ", "")).replace(".0℃", ""));

        threeWeather.add(data1);
        threeWeather.add(data2);
        threeWeather.add(data3);
        return threeWeather;
    }

    public static List<Map<String, Object>> getWeatherByNowAPI(String cityName) throws IOException {
        List<Map<String, Object>> threeWeather = new ArrayList<>(3);
        List<String> weatherData = nowAPI(cityName);
        JSONObject weatherObject = new JSONObject(weatherData.get(0));

        int success = weatherObject.getInt("success");
        if (success == 1) {
            JSONArray result = weatherObject.getJSONArray("result");
            JSONObject jo1 = result.getJSONObject(0);
            Map<String, Object> data1 = new HashMap<>();
            data1.put("cityName", jo1.getString("citynm"));
            data1.put("weatherDes", jo1.getString("weather"));
            data1.put("min", jo1.getString("temp_low"));
            data1.put("max", jo1.getString("temp_high"));
            data1.put("wind", jo1.getString("wind") + jo1.getString("winp"));

            JSONObject weatherObject2 = new JSONObject(weatherData.get(1));
            JSONArray result2 = weatherObject2.getJSONArray("result");
            JSONObject jo = result2.getJSONObject(0);
            data1.put("air", jo.getString("lifeindex_kq_attr"));

            JSONObject jo2 = result.getJSONObject(1);
            Map<String, Object> data2 = new HashMap<>();
            data2.put("weatherDes", jo2.getString("weather"));
            data2.put("min", jo2.getString("temp_low"));
            data2.put("max", jo2.getString("temp_high"));

            JSONObject jo3 = result.getJSONObject(2);
            Map<String, Object> data3 = new HashMap<>();
            data3.put("weatherDes", jo3.getString("weather"));
            data3.put("min", jo3.getString("temp_low"));
            data3.put("max", jo3.getString("temp_high"));

            threeWeather.add(data1);
            threeWeather.add(data2);
            threeWeather.add(data3);
        }
        return threeWeather;
    }
}
