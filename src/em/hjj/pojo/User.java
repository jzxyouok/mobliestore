package em.hjj.pojo;

public class User {
private int id;
private String name;
private String pwd;
private String n;

public String getN() {
	return n;
}
public void setN(String n) {
	this.n = n;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public User(int id, String name, String pwd) {
	super();
	this.id = id;
	this.name = name;
	this.pwd = pwd;
}
public User() {
	super();
}
public User(String name, String pwd) {
	super();
	this.name = name;
	this.pwd = pwd;
}
@Override
public String toString() {
	return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + "]";
}


}

