package em.hjj.pojo;

public class Depot {
private int id;
private int eid;
private String intime;
private int num; 
private String  person;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getEid() {
	return eid;
}
public void setEid(int eid) {
	this.eid = eid;
}
public String getIntime() {
	return intime;
}
public void setIntime(String intime) {
	this.intime = intime;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getPerson() {
	return person;
}
public void setPerson(String person) {
	this.person = person;
}
@Override
public String toString() {
	return "Depot [id=" + id + ", eid=" + eid + ", intime=" + intime + ", num=" + num + ", person=" + person + "]";
}
}
