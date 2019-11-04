package zhaoyy.springboot_shiro.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

/**
 * @author zhaoyuyang
 * @createTime 2019/11/4 0004 17:30
 */
public class MyErrorEntity {
    /**
     * 默认错误类型
     */
    private final static HttpStatus DEFAULT_HTTP_STATUS = HttpStatus.INTERNAL_SERVER_ERROR;
    private final static int DEFAULT_CODE = 0;
    private HttpStatus httpStatus;
    private String message;
    private Object data;
    private int code = DEFAULT_CODE;

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public void setHttpStatus(HttpStatus httpStatus) {
        this.httpStatus = httpStatus;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public MyErrorEntity() {
    }

    public MyErrorEntity(String message) {
        init(message);
    }
    public MyErrorEntity(HttpStatus httpStatus, String message){
        init(httpStatus, code, message, null);
    }

    public void init(String message) {
        this.init(DEFAULT_HTTP_STATUS, message);
    }


    public void init(HttpStatus httpStatus, String message) {
        this.init(httpStatus, DEFAULT_CODE, message, null);
    }

    /**
     * 初始化
     *
     * @param httpStatus httpCode
     * @param code       错误类型,默认为0
     * @param message    错误提示信息
     * @param data       错误数据对象,自定义
     */
    public void init(HttpStatus httpStatus, int code, String message, Object data) {
        if (httpStatus != null) {
            this.httpStatus = httpStatus;
        }
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public ResponseEntity build(){
        Map<String, Object> map = new HashMap<>(6);
        map.put("code", httpStatus.value());
        map.put("message", message);
        map.put("data", data);
        return new ResponseEntity<>(map, httpStatus);
    }
}
