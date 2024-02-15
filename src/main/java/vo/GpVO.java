package vo;

import org.springframework.web.multipart.MultipartFile;

public class GpVO {
	private int pid;
	private String productname, species, category, price, productdetail,
	filename, regdate, popularity;
	//업로드 된 파일을 받기위한 클래스
	MultipartFile photo;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getSpecies() {
		return species;
	}
	public void setSpecies(String species) {
		this.species = species;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductdetail() {
		return productdetail;
	}
	public void setProductdetail(String productdetail) {
		this.productdetail = productdetail;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPopularity() {
		return popularity;
	}
	public void setPopularity(String popularity) {
		this.popularity = popularity;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	

}
