package em.hjj.pojo;

import java.io.Serializable;

public class Page implements Serializable {
private int begin;
private int size;
public int getBegin() {
	return begin;
}

public Page() {
	super();
}

public Page(int begin, int size) {
	super();
	this.begin = begin;
	this.size = size;
}

public void setBegin(int begin) {
	this.begin = begin;
}
public int getSize() {
	return size;
}
public void setSize(int size) {
	this.size = size;
}

}
