package zhaoyy.springboot_shiro.exception;

/**
 * @author zhaoyuyang
 * @createTime 2019/11/4 0004 17:28
 */
public class MyException extends RuntimeException{
    private MyErrorEntity errorEntity;

    public MyErrorEntity getErrorEntity() {
        return errorEntity;
    }

    public void setErrorEntity(MyErrorEntity errorEntity) {
        this.errorEntity = errorEntity;
    }

    public MyException(MyErrorEntity entity){
        super(entity == null ? null : entity.getMessage());
        this.errorEntity = entity;
    }

    public MyErrorEntity getErrorResponseEntity() {
        return errorEntity;
    }
}
