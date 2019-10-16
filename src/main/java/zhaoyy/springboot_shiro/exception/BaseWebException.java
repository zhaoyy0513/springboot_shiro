/**
 * 请求出错时抛出的异常
 * @author zhangsong
 * @since 2019-07-31
 */
package zhaoyy.springboot_shiro.exception;

public class BaseWebException extends RuntimeException {

    private ErrorResponseEntity errorResponseEntity;

    public BaseWebException(String message) {
        super(message);
        this.errorResponseEntity = new ErrorResponseEntity(message);
    }

    public BaseWebException(ErrorResponseEntity errorResponseEntity) {
        super(errorResponseEntity == null ? null : errorResponseEntity.getMessage());
        this.errorResponseEntity = errorResponseEntity;
    }

    public BaseWebException(String message, Throwable cause) {
        super(message, cause);
        this.errorResponseEntity = new ErrorResponseEntity(message);
    }

    public BaseWebException(ErrorResponseEntity errorResponseEntity, Throwable cause) {
        super(errorResponseEntity == null ? null : errorResponseEntity.getMessage(), cause);
        this.errorResponseEntity = errorResponseEntity;
    }

    public ErrorResponseEntity getErrorResponseEntity() {
        return errorResponseEntity;
    }

    public void setErrorResponseEntity(ErrorResponseEntity errorResponseEntity) {
        this.errorResponseEntity = errorResponseEntity;
    }

    @Override
    public String toString() {
        return "BaseWebException{" +
                "errorResponseEntity=" + errorResponseEntity +
                '}';
    }
}
