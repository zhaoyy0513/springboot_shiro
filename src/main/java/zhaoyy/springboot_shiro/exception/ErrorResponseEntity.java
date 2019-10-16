/**
 * @author zhangsong
 */
package zhaoyy.springboot_shiro.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.util.HashMap;
import java.util.Map;

public class ErrorResponseEntity {

    /**
     * 默认错误 http code 为500
     */
    private final static HttpStatus DEFAULT_HTTP_STATUS = HttpStatus.INTERNAL_SERVER_ERROR;

    /**
     * 默认错误类型
     */
    private final static int DEFAULT_CODE = 0;

    /**
     * http 状态码
     */
    private HttpStatus httpStatus = DEFAULT_HTTP_STATUS;

    /**
     * 错误类型
     */
    private int code = DEFAULT_CODE;

    /**
     * 错误信息,能直接展示给用户看的信息
     */
    private String message;

    /**
     * 错误信息
     */
    private Object data;

    public ErrorResponseEntity(HttpStatus httpStatus, int code, String message, Object data) {
        init(httpStatus, code, message, data);
    }

    public ErrorResponseEntity(HttpStatus httpStatus, String message) {
        init(httpStatus, message);
    }

    public ErrorResponseEntity(String message) {
        init(message);
    }

    public ErrorResponseEntity() {
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

    public void init(HttpStatus httpStatus, String message) {
        this.init(httpStatus, DEFAULT_CODE, message, null);
    }

    public void init(String message) {
        this.init(DEFAULT_HTTP_STATUS, message);
    }

    /**
     * 创建 response 对象返回
     *
     * @return
     */
    public ResponseEntity build() {
        Map<String, Object> map = new HashMap<>(6);
        map.put("code", code);
        map.put("message", message);
        map.put("data", data);
        return new ResponseEntity<>(map, httpStatus);
    }

    /**
     * 传入提示信息,返回400错误码对应的实例
     * @param message
     * @return
     */
    public static ErrorResponseEntity getBadRequestInstance(String message){
        return new ErrorResponseEntity(HttpStatus.BAD_REQUEST, message);
    }

    /**
     * 返回默认状态码对应的实例
     * @param message
     * @return
     */
    public static ErrorResponseEntity getInstance(String message){
        return new ErrorResponseEntity(message);
    }

    /**
     * 根据状态码和错误信息,构建实例
     * @param httpStatus
     * @param message
     * @return
     */
    public static ErrorResponseEntity getInstance(HttpStatus httpStatus, String message){
        return new ErrorResponseEntity(httpStatus, message);
    }

    public static ErrorResponseEntity getInstance(HttpStatus httpStatus, int code, String message, Object data) {
        return new ErrorResponseEntity(httpStatus, code, message, data);
    }

    public HttpStatus getHttpStatus() {
        return httpStatus;
    }

    public void setHttpStatus(HttpStatus httpStatus) {
        this.httpStatus = httpStatus;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
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

    @Override
    public String toString() {
        return "ErrorResponseEntity{" +
                "httpStatus=" + httpStatus +
                ", code=" + code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
