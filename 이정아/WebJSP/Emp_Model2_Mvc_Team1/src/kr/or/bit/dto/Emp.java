package kr.or.bit.dto;

import java.util.Date;

public class Emp {
	private long empno;
	private String ename;
	private String job;
	private long mgr;
	private Date hiredate;
	private long sal;
	private long comm;
	private long deptno;


	public Emp() {
		
	}

	public Emp(long empno, long deptno, String ename,String job, long comm, Date hiredate, long mgr, long sal) {
		super();
		this.empno = empno;
		this.deptno = deptno;
		this.ename = ename;
		this.job = job;
		this.comm = comm;
		this.hiredate = hiredate;
		this.mgr = mgr;
		this.sal = sal;

	}
	
	
	public long getEmpno() {
		return empno;
	}

	public void setEmpno(long empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public long getMgr() {
		return mgr;
	}

	public void setMgr(long mgr) {
		this.mgr = mgr;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public long getSal() {
		return sal;
	}

	public void setSal(long sal) {
		this.sal = sal;
	}

	public long getComm() {
		return comm;
	}

	public void setComm(long comm) {
		this.comm = comm;
	}

	public long getDeptno() {
		return deptno;
	}

	public void setDeptno(long deptno) {
		this.deptno = deptno;
	}

	@Override
	public String toString() {
		return "Emp [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + "]";
	}

}
