package kr.member.vo;

public class MemberVO {
	
	private Long member_Id;
	private String user_id;
	private String password;
	private String name;
	private String birthdate;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String join_date;
	private String member_grade;
	private int grade_point;
	private boolean marketing_agree;
	private int status;
	private String last_login_date;
	public Long getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(Long member_Id) {
		this.member_Id = member_Id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public int getGrade_point() {
		return grade_point;
	}
	public void setGrade_point(int grade_point) {
		this.grade_point = grade_point;
	}
	public boolean isMarketing_agree() {
		return marketing_agree;
	}
	public void setMarketing_agree(boolean marketing_agree) {
		this.marketing_agree = marketing_agree;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	
	
}
