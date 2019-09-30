package cn.manageUser.pojo;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

public class User {
    private int uid;

    @NotEmpty(message = "用户名不能为空")
    private String uname;
    private int uage;
    private String usex;

    @NotNull
    @Length(min = 6, max = 12, message = "密码必须是6到12位的字符串")
    private String upassword;

    @NotEmpty(message = "QQ不能为空")
    private String uqq;

    @NotEmpty(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String uemail;

    @NotEmpty(message = "籍贯不能为空")
    private String uaddress;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }

    public String getUqq() {
        return uqq;
    }

    public void setUqq(String uqq) {
        this.uqq = uqq;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", uage=" + uage +
                ", usex='" + usex + '\'' +
                ", upassword='" + upassword + '\'' +
                ", uqq='" + uqq + '\'' +
                ", uemail='" + uemail + '\'' +
                ", uaddress='" + uaddress + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null){
            return false;
        }
        if (obj == this){
            return true;
        }
        if (obj instanceof User){
            User user = (User) obj;
            if (user.getUid() == this.getUid()){
                return true;
            }else {
                return false;
            }
        }
        return false;
    }
}
